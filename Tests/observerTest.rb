
require_relative '../MCV/SportEventController.rb'
require_relative '../MCV/GamblerController.rb'
require_relative '../MCV/BookieController.rb'
e1 = SportEventController.new("xavier",1)
e1.createSportEvent
g1 = GamblerController.new
g1.createUser
g1.updateView
e1.addObserver(g1)
e1.updateView
e1.updateOdd
e1.updateState
e1.setResult
e1.updateView
