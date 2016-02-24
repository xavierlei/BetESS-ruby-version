require_relative 'Gambler.rb'
require_relative 'Bet.rb'
require_relative 'BetView'
class BetController < Object
	def initialize(better)
		@view = BetView.new
		@model = Bet.new
		@mode.setGambler(Gambler)
	end


end
