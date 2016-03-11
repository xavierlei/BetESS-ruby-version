
require_relative 'SportEventController.rb'
require_relative 'GamblerController.rb'
require_relative 'BookieController.rb'
e1 = SportEventController.new("xavier",1)
e1.createSportEvent
b1 = BookieController.new
b1.create
e1.addObserver(b1)
e1.updateView
e1.updateOdd
e1.updateState
e1.setResult
e1.updateView
