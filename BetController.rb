require_relative 'Gambler.rb'
require_relative 'Bet.rb'
require_relative 'BetView.rb'
class BetController < Object
	attr_reader :model
	def initialize
		@view = BetView.new
		@model = Bet.new
		@model.setGambler("Joe Spaghetti O's")
	end
	def create(gambler_id,odd)
		query = @view.createView
		@model.setGambler(gambler_id)
		@model.setValue(query[0])
		@model.setResult(query[1])
		@model.setOdd(odd)
	end
	def updateView
		@view.printView(@model.value,@model.result,@model.gambler_id,@model.odd)
	end
end
