require_relative 'Better.rb'
require_relative 'BetterView.rb'

class BetterController < Object

	def initialize
		@model = Better.new
		@view = BetterView.new
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

end
