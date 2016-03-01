require_relative 'GamblerController.rb'
require_relative 'SportEventController.rb'
require_relative 'BetController.rb'
control =  GamblerController.new
control.createUser


event = SportEventController.new
event.createSportEvent


bet = BetController.new
bet.create(control.model.username,event.model.odd)
bet.updateView
