require_relative 'Facade.rb'
require_relative 'String.rb'

class UI < Object

	def initialize
		@on = true
		@logged = false
		@facade = Facade.new
		@session
	end

	def printMenuLogin
		puts " register [bookie | gambler]"
		puts " login [bookie | gambler] [username] [password]"
		puts " exit "
	end

	def printMenuGambler
		puts " #{"listevents".green} - list all available events"
		puts " #{"bet [event_id]".green} - place a bet on the event"
		puts " #{"mybets".green} - betting history"
		puts " #{"observe [event_id]".green}"
		puts " #{"readmessages".green} - read all notifications "
		puts " #{"profileinfo".green} - shows your profile information"
		puts " #{"settings".green} - change profile information"
		puts " #{"man".green} - shows this commands list"
		puts " #{"exit".green} - go back to main-menu"
	end

	def printMenuBookie
		puts " #{"listevents".green} - list all available events to gamblers"
		puts " #{"myevents".green} - list all events owned by you"
		puts " #{"newevent".green} - create new event"
		puts " #{"observe [event_id]".green} - receive notifications from this event"
		puts " #{"update [event_id]".green} - update status for this event"
		puts " #{"changeodd [event_id]".green} - update odd for this event"
		puts " #{"close [event_id]".green} - insert final result of the match"
		puts " #{"readmessages".green} - read all notifications "
		puts " #{"settings".green} - change profile information"
		puts " #{"exit".green} - go back to main-menu"
	end

	def loggedGambler
		while @logged && @on do
			print "gambler-"
			print "#{@session.model.username}".cyan
			print ">"
			cmd = gets.chomp.split(" ")
			case cmd[0]
			when "listevents"
				puts "---  Available Events  ---"
				@facade.listGamblerAvailableEvents
				puts "--------------------------"
			when "bet"
				if cmd[1]
					@facade.placeBet(cmd[1].to_i,@session.model.username)
				end
			when "mybets"
				@facade.bettingHistory(@session.model.username)
			when "observe"
				@facade.showInterestGambler(@session.model.username, cmd[1].to_i)
			when "readmessages"
				@facade.gamblerNotifications(@session.model.username)
			when "profileinfo"
				@session.profileInfo
			when "settings"
				@session.updateUser
			when "man"
				puts "________________________"
				self.printMenuGambler
				puts "________________________"
			when "exit"
				@on = false
			when nil
			else
				puts " Command not recognized! - use command #{"man".green} to see a list of commands "
			end
		end
	end

	def loggedBookie
		while @logged && @on do
			print "bookie-"
			print "#{@session.model.username}".yellow
			print ">"
			cmd = gets.chomp.split(" ")
			case cmd[0]
			when "listevents"
				puts "---  Available Events  ---"
				@facade.listGamblerAvailableEvents
				puts "--------------------------"
			when "myevents"
				@facade.listEvents(@session.model.username)
			when "newevent"
				@facade.newEvent(@session.model.username)
			when "observe"
				if cmd[1]
					@facade.showInterestBookie(@session.model.username,cmd[1].to_i)
				end
			when "update"
				if cmd[1]
					@facade.updateEventState(cmd[1].to_i)
				end
			when "changeodd"
				if cmd[1]
					@facade.changeOdd(cmd[1].to_i)
				end
			when "close"
				if cmd[1]
					@facade.endEvent(cmd[1].to_i)
				end
			when "readmessages"
				@facade.bookieNotifications(@session.model.username)
			when "settings"
			when "man"
				puts "________________________"
				self.printMenuBookie
				puts "________________________"
			when "exit"
				@on = false
			when nil
			else
				puts " Command not recognized! - use command #{"man".green} to see a list of commands "
			end
		end
	end

	def notLogged
		while @logged && @on do
			puts "not implemented yet"
		end
	end

	def login(cmd)
		if cmd.size == 4
			case cmd[1]
			when "bookie"
				@session = @facade.bookieLogin(cmd[2],cmd[3])
				if @session != nil
					puts "#{"Login complete!".negative.green}\n Welcome #{cmd[2]}!"
					@logged = true
					self.loggedBookie
				else
					puts "Login #{"failed".negative.red}, user:#{cmd[2]}"
				end
			when "gambler"
				@session = @facade.gamblerLogin(cmd[2],cmd[3])
				if @session!=nil
					puts "#{"Login complete!".negative.green}\n Welcome #{cmd[2]}!"
					@logged = true
					self.loggedGambler
				else
					puts "Login #{"failed".negative.red}, user:#{cmd[2]}"
				end
			else
				puts "syntax error, see manual"
			end
		else
			puts "error syntax"
		end
	end

	def register(cmd)
		if cmd.size == 2
			case cmd[1]
			when "bookie"
				@session = @facade.registerBookie
				@session.updateView
			when "gambler"
				@session = @facade.registerGambler
				@session.updateView
			else
				puts "syntax error, see manual"
			end
		else
			puts "error syntax"
		end
	end



	def commandLine
		puts " \t                   \t   ".negative.cyan
		puts " \tBem-Vindo ao BetESS\t   ".negative.cyan
		puts " \t                   \t   ".negative.cyan
		while @on do
			self.printMenuLogin
			print "#{"main-menu".green}>"
			cmd = gets.chomp.split(" ")
			if !(cmd.empty?)
				case cmd[0]
				when "register"
					register(cmd)
				when "login"
					login(cmd)
					@on = true
				when "exit"
					@on = false
				else
					puts "syntax error"
				end
			end
		end
	end



end
