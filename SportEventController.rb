require_relative 'SportEvent.rb'
require_relative 'SportEventView.rb'
class SportEventController < Object
	attr_reader :model
	def initialize(owner, event_id)
		@model = SportEvent.new(owner, event_id)
		@view = SportEventView.new
		@bet_list = Hash.new('Gambler has no Bets on this SportsEvent')
	end

	def createDefaultSportEvent(team1, team2, odd)
		@model.setTeam1(team1)
		@model.setTeam2(team2)
		@model.setOdd(odd)
	end

	def createSportEvent
		query = @view.createView
		@model.setTeam1(query[0])
		@model.setTeam2(query[1])
		@model.setOdd(query[2])
	end

	def updateOdd
		@model.setOdd(@view.updateOdd)
	end

	def updateState
		@model.setState(@view.updateState)
	end

	def setResult
		unless @model.result == "-"
			@model.setResult(@view.setResult)
		end
	end

	def updateView
		@view.printView(@model.event_id,@model.state,@model.team1,@model.team2,@model.odd,@model.result)
	end

	def addBet(bet)
		unless @bet_list.key?(bet.model.gambler_id)
			@bet_list[bet.model.gambler_id] = [bet]
		else
			@bet_list[bet.model.gambler_id].push(bet)
		end
	end

end
