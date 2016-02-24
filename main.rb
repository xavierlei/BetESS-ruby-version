require_relative 'BetterController.rb'
require_relative 'SportEventController.rb'
=begin
control =  BetterController.new
control.createUser
control.updateView
control.updateUser
control.updateView
=end
event = SportEventController.new
event.createSportEvent
event.updateView
event.updateSportEvent
event.updateView