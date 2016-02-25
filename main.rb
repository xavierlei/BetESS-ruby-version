require_relative 'GamblerController.rb'
require_relative 'SportEventController.rb'

control =  GamblerController.new
control.createUser
control.updateView
control.updateUser
control.updateView

event = SportEventController.new
event.createSportEvent
event.updateView
event.updateSportEvent
event.updateView
