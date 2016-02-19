require_relative 'Apostador.rb'
require_relative 'ApostadorView.rb'

class ApostadorController < Object

	def initialize
		@model = Apostador.new
		@view = ApostadorView.new
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
