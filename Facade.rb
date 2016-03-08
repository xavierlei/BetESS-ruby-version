require_relative 'GamblerController.rb'
require_relative 'BookieController.rb'
require_relative 'SportEventController.rb'
require_relative 'BetController.rb'
require_relative 'Populate.rb'

class Facade < Object

  def initialize
    @event_counter = 0
  end

  gamblers = Hash.new('user doesnt exist!\n') #GamblersController
  bookies = Hash.new('user doesnt exist!\n') #BookieController
  events = Hash.new('event doesnt exist!\n') #SportEventController

  # Populate -------------------------------
  pop = Populate.new
  pop.populate(gamblers, bookies, events, @event_counter)

  # Login for Gamblers and Bookies ---------
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

  # Gambler --------------------------------
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
  def gamblerBalance(gambler_id)
    puts "saldo: #{ gamblers[gambler_id].model.saldo }"
  end
  def placeBet(event_id, gambler_id)
    bet_controller = BetController.new
    odd = events[event_id].model.odd
    bet_controller.create(gambler_id,odd)
    events[event_id].addBet(bet_controller)
  end
  def bettingHistory
    puts "NotImplemented"
  end

  # Bookie ---------------------------------
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
  def updateEventState(event_id)
    events[event_id].updateState
  end
  def changeOdd(event_id)
    events[event_id].updateOdd
  end
  def endEvent
    puts "NotImplemented"
  end
  def showInterest
    puts "NotImplemented"
  end
  def bookieNotifications
    puts "NotImplemented"
  end

  # Event ----------------------------------
  def newEvent(owner)
    controller = SportEventController.new(owner, @event_counter++)
    controller.createSportEvent
    events[controller.model.event_id] = controller
  end
  def listEvents
    events.each do |key,value|
      if value.model.state #mudar nome 'state' para 'open'
        puts "#{key} - #{value}"
      end
  end


end
