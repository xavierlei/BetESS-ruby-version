require_relative 'Gambler.rb'
require_relative 'GamblerView.rb'

class GamblerController < Object
	attr_reader :model
	def initialize
		@model = Gambler.new
		@view = GamblerView.new
	end

	def createUser
		data = @view.createView
		@model.setUsername(data[0])
		@model.setPassword(data[1])
		@model.setSaldo(data[2])
	end

	def updateUser
		data = @view.updateView
		@model.setPassword(data[0])
		@model.setSaldo(data[1])
	end


	def updateView
		@view.printView(@model.username,@model.saldo)
	end

	def createDefaultGambler(name, pass, saldo)
		@model.setUsername(name)
		@model.setPassword(pass)
		@model.setSaldo(saldo)
	end

end
