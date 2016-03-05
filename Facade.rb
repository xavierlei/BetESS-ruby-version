require_relative 'GamblerController.rb'
require_relative 'BookieController.rb'
require_relative 'SportEventController.rb'
require_relative 'BetController.rb'
require_relative 'Populate.rb'

class Facade < Object

  def initialize
    @event_counter = 0
  end

  gamblers = Hash.new('user doesnt exist!\n') #GamblersController.model.password
  bookies = Hash.new('user doesnt exist!\n') #BookieController.model.password
  events = Hash.new('event doesnt exist!\n')

  # Populate
  pop = Populate.new
  pop.populate(gamblers, bookies, events, @event_counter)

  # Login for Gamblers and Bookies
  def gamblerLogin(username, password)
    if password == gamblers[username].model.password
      puts "Login completed.\n"
      controller = gamblers[username]
    else
      return nil
    end
  end
  def bookieLogin(username, password)
    if password == bookies[username].model.password
      puts "Login completed.\n"
      controller = bookies[username]
    else
      return nil
    end
  end

  # Gambler
  def registerGambler
    controller = GamblerController.new
    controller.createUser
    if gamblers.has_key?(controller.model.username)
      return nil
    else
      gamblers[controller.model.username] = controller
      return controller
    end
  end


  # Bookie
  def registerBookie
    controller = BookieController.new
    controller.create
    if gamblers.has_key?(controller.model.username)
      controller = nil
    else
      gamblers[controller.model.username] = controller
      return controller
    end
  end

  # Event
  def newEvent(owner)
    controller = SportEventController.new(owner, @event_counter++)
    controller.createSportEvent
    events[controller.model.event_id] = controller
  end

end
