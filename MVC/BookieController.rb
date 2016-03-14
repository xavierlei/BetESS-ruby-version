require_relative 'Bookie.rb'
require_relative 'BookieView.rb'
require_relative '../ObserverPattern/Observer.rb'
class BookieController < Object
	include Observer
	attr_reader :model
	def initialize
		super()
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
		@model.setUsername(name)
		@model.setPassword(pass)
	end

	def readAllNotifications
		if @notifications != nil
			@notifications.each { |msg| @view.showNotification(msg)}
		end
	end

end
