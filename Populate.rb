require_relative './MVC/GamblerController.rb'
require_relative './MVC/SportEventController.rb'
require_relative './MVC/BookieController.rb'

class Populate < Object
	def populate(gamblers, bookies, events, event_counter)

    # Gambler N1
    control = GamblerController.new
    control.createDefaultGambler('afonso', '123', 789)
    gamblers[control.model.username] = control
    # Gambler N2
    control = GamblerController.new
    control.createDefaultGambler('ana', '123', 1024)
    gamblers[control.model.username] = control


		# Bookie N1
    control = BookieController.new
    control.createDefaultBookie('clara', '123')
    bookies[control.model.username] = control
    # Bookie N2
    control = BookieController.new
    control.createDefaultBookie('rui', '123')
    bookies[control.model.username] = control


		# Event N1
		control = SportEventController.new("rui",1)
		control.createDefaultSportEvent("porto","benfica",[2,3,9],true)
    control.addObserver(bookies['rui'])
		events[1] = control
		event_counter+=1
		# Event N2
		control = SportEventController.new("rui",2)
		control.createDefaultSportEvent("algarve","beira-alta",[2,3,9],false)
    control.addObserver(bookies['rui'])
		events[2] = control
		event_counter+=1
		# Event N3
		control = SportEventController.new("clara",3)
		control.createDefaultSportEvent("aaa","bbb",[2,3,9],false)
    control.addObserver(bookies['clara'])
		events[3] = control
		event_counter+=1

		return event_counter
	end
end
