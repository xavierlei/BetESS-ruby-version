require_relative 'GamblerController.rb'
require_relative 'SportEventController.rb'
require_relative 'BookieController.rb'

class Populate < Object
	def populate(gamblers, bookies, events)
    # Gambler N1
    control = GamblersController.new
    control.createDefaultGambler('joaquim', '123', 789)
    gamblers[control.model.username] = control
    # Gambler N2
    control = GamblersController.new
    control.createDefaultGambler('afonso', '123', 1024)
    gamblers[control.model.username] = control

    # Bookie N1
    control = BookieController.new
    control.createDefaultBookie('ana', '123')
    gamblers[control.model.username] = control
    # Bookie N2
    control = BookieController.new
    control.createDefaultBookie('rui', '123')
    gamblers[control.model.username] = control
	end
