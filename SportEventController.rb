require_relative 'SportEvent.rb'
require_relative 'SportEventView.rb'
class SportEventController < Object
	def initialize
		@model = SportEvent.new
		@view = SportEventView.new
		@bet_list
	end

	def createSportEvent
		query = @view.createView
		@model.setTeam1(query[0])
		@model.setTeam2(query[1])
		@model.setOdd(query[2])
		@bet_list = new Hash.new('Gambler has no Bets for this SportsEvent')
	end

	def updateSportEvent
		query = @view.updateView
		@model.setOdd(query)
	end

	def updateView
		@view.printView(@model.team1,@model.team2,@model.odd,@model.result)
	end

	def addBet(bet)
		unless @bet_list.has_key?(bet.model.gambler_id)
			@bet_list[bet.model.gambler_id] = [bet]
		else
			@bet_list[bet.model.gambler_id].push(bet)
		end
	end

end
