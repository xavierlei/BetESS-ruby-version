require_relative 'SportEvent.rb'
require_relative 'SportEventView.rb'
class SportEventController < Object
	def initialize
		@model = SportEvent.new
		@view = SportEventView.new
	end

	def createSportEvent
		query = @view.createView
		@model.setTeam1(query[0])
		@model.setTeam2(query[1])
		@model.setOdd(query[2])
	end
	def updateSportEvent
		query = @view.updateView
		@model.setOdd(query)
	end

	def updateView
		@view.printView(@model.team1,@model.team2,@model.odd,@model.result)
	end

end