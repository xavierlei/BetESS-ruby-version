require_relative 'GamblerController.rb'
require_relative 'BookieController.rb'
require_relative 'SportEventController.rb'
require_relative 'BetController.rb'
require_relative 'Populate.rb'

class Facade < Object

  def initialize
    @event_counter = 0
    @gamblers = Hash.new("user doesnt exist!\n") #GamblersController
    @bookies = Hash.new("user doesnt exist!\n") #BookieController
    @events = Hash.new("event doesnt exist!\n") #SportEventController
    # Populate -------------------------------
    pop = Populate.new
    pop.populate(@gamblers, @bookies, @events, @event_counter)
  end


#BEGIN listar Hashes ------
def listarEventos
  @events.each do |key,value|
      puts "#{key} - #{value}"
  end
end
#END listar Hashes --------


  # Login for Gamblers and Bookies ---------
  def gamblerLogin(username, password)
    if @gamblers.key?(username)
      if password == @gamblers[username].model.password
        puts "[OK]\tLogin completed. Welcome #{username}\n"
        controller = @gamblers[username]
      else
        return nil
      end
    else
      puts "[!]\tFalhou o Login para #{username}"
    end
  end
  def bookieLogin(username, password)
    if @bookies.key?(username)
      if password ==  @bookies[username].model.password
        puts "[OK]\tLogin completed. Welcome #{username}\n"
        controller =  @bookies[username]
      else
        return nil
      end
    else
      puts "[!]\tFalhou Login para #{username}"
    end
  end

  # Gambler --------------------------------
  def registerGambler
    controller = GamblerController.new
    controller.createUser
    if @gamblers.has_key?(controller.model.username)
      return nil
    else
      @gamblers[controller.model.username] = controller
      return controller
    end
  end

  def placeBet(event_id, gambler_id)
    if @events.key?(event_id)
      bet_controller = BetController.new
      odd = @events[event_id].model.odd
      bet_controller.create(gambler_id,odd)
      @events[event_id].addBet(bet_controller)
      @gamblers[gambler_id].registBet(event_id,bet_controller)
    end
  end
  def bettingHistory(gambler_id)
    puts "NotImplemented"
  end

  # Bookie ---------------------------------
  def registerBookie
    controller = BookieController.new
    controller.create
    if  @bookies.has_key?(controller.model.username)
      controller = nil
    else
       @bookies[controller.model.username] = controller
      return controller
    end
  end
  def updateEventState(event_id)
    if @events.key?(event_id)
      @events[event_id].updateState
    end
  end
  def changeOdd(event_id)
    if @events.key?(event_id)
      @events[event_id].updateOdd
    end
  end
  def endEvent(event_id)
    if @events.key?(event_id)
      @events[event_id].setResult
    end
  end
  def showInterest
    puts "NotImplemented"
  end
  def bookieNotifications
    puts "NotImplemented"
  end

  # Event ----------------------------------
  def newEvent(owner)
    controller = SportEventController.new(owner, @event_counter+=1)
    controller.createSportEvent
    @events[controller.model.event_id] = controller
    puts @events
  end
  def openEvent(event_id)
    if @events.key?(event_id)
      @events[event_id].model.setState(true)
    end
  end
  def listEvents(owner_id)
    @events.each do |key,value|
      if value.model.owner_id == owner_id
        value.updateView
      end
    end
  end
  def listGamblerAvailableEvents
    @events.each do |key,value|
      if value.model.state == true
        value.updateView
      end
    end
  end



end
