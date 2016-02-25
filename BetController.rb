require_relative 'Gambler.rb'
require_relative 'Bet.rb'
require_relative 'BetView'
class BetController < Object
	attr_reader :model
	def initialize(gambler_id)
		@view = BetView.new
		@model = Bet.new
		@model.setBetter(gambler_id)
	end

def createGambler




end
