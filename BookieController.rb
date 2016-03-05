require_relative 'Bookie.rb'
require_relative 'BookieView.rb'
class BookieController < Object
	attr_reader :model
	def initialize
		@view = BookieView.new
		@model = Bookie.new
	end
	def create
		data = @view.createView
		@model.setUsername(data[0])
		@model.setPassword(data[1])
	end
	def update
		password = @view.updateView
		@model.setPassword(password)
	end
	def updateView
		@view.printView(@model.username,@model.password)
	end

	def createDefaultBookie(name, pass)
		@model.setUsername = name
		@model.setPassword = pass
	end


end
