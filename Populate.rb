require_relative 'GamblerController.rb'
require_relative 'SportEventController.rb'
require_relative 'BookieController.rb'

class Populate < Object
	def populate(gamblers, bookies, events, event_counter)
    # Gambler N1
    control = GamblerController.new
    control.createDefaultGambler('joaquim', '123', 789)
    gamblers[control.model.username] = control
    # Gambler N2
    control = GamblerController.new
    control.createDefaultGambler('afonso', '123', 1024)
    gamblers[control.model.username] = control

    # Bookie N1
    control = BookieController.new
    control.createDefaultBookie('ana', '123')
    bookies[control.model.username] = control
    # Bookie N2
    control = BookieController.new
    control.createDefaultBookie('rui', '123')
    bookies[control.model.username] = control


		# Event N1
		control = SportEventController.new("rui",1)
		control.createDefaultSportEvent("porto","benfica",[2,3,9])
        control.addObserver(bookies['rui'])
		events[1] = control
		# Event N2
		control = SportEventController.new("rui",2)
		control.createDefaultSportEvent("algarve","beira-alta",[2,3,9])
        control.addObserver(bookies['rui'])
		events[2] = control
		# Event N3
		control = SportEventController.new("ana",3)
		control.createDefaultSportEvent("aaa","bbb",[2,3,9])
        control.addObserver(bookies['ana'])
		events[3] = control

	end
end
