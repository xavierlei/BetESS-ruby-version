require_relative 'better.rb'
require_relative 'Bet.rb'
require_relative 'BetView'
class BetController < Object
	def initialize(better)
		@view = BetView.new
		@model = Bet.new
		@mode.setBetter(better)
	end


end
