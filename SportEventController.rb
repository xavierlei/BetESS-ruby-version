require_relative 'SportEvent.rb'
require_relative 'SportEventView.rb'
require_relative 'Subject.rb'
## de forma a não alterar todo o código, o addObserver para o bookie dono será feito no facade
## o mesmo para o calculo do total ganho e notify desse total 
class SportEventController < Object
	include Subject
	attr_reader :model, :bet_list
	def initialize(owner, event_id)
		super()
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
		notifyObservers("odd for event nº #{@model.event_id} is now #{@model.odd}")
	end

	def updateState
		@model.setState(@view.updateState)
		notifyObservers("state of event nº #{@model.event_id} is now #{@model.state}")
	end

	def setResult
		unless @model.result != "-"
			@model.setResult(@view.setResult)
			notifyObservers("event nº #{@model.event_id} has ended with result: #{@model.result}")
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
