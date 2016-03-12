require_relative 'Facade.rb'

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
		puts " exit"
	end

	def printMenuGambler
		puts " listevents"
		puts " bet [event_id]"
		puts " mybets"
		puts " settings"
		puts " exit"
	end

	def printMenuBookie
		puts " listevents"
		puts " myevents"
		puts " observe [event_id]"
		puts " update [event_id]"
		puts " close [event_id]"
		puts " settings"
		puts " exit"
		#print "bookie>"
		#$stdout.flush
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
			when "settings"
			when "exit"
				@on = false
			when nil
			else
				puts "Command not recognized !"
				puts "________________________"
				self.printMenuGambler
				puts "________________________"
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
				@facade.listGamblerAvailableEvents
			when "myevents"
				@facade.listEvents(@session.model.username)
			when "observe"
				if cmd[1]
					@facade.showInterestBookie(@session.model.username,cmd[1].to_i)
				end
			when "update"
				if cmd[1]
					@facade.updateEventState(cmd[1].to_i)
				end
			when "close"
				if cmd[1]
					@facade.endEvent(cmd[1].to_i)
				end
			when "settings"
			when "exit"
				@on = false
			when nil
			else
				puts "Command not recognized !"
				puts "________________________"
				self.printMenuBookie
				puts "________________________"
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
					@logged = true
					self.loggedBookie
				end
			when "gambler"
				@session = @facade.gamblerLogin(cmd[2],cmd[3])
				if @session!=nil
					@logged = true
					self.loggedGambler
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
		puts "                     ".negative.cyan
		puts " Bem-Vindo ao BetESS ".negative.cyan
		puts "                     ".negative.cyan
		while @on do
			self.printMenuLogin
			print "main-menu".green
			print ">"
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




class String
  { :reset          =>  0,
    :bold           =>  1,
    :dark           =>  2,
    :underline      =>  4,
    :blink          =>  5,
    :negative       =>  7,
    :black          => 30,
    :red            => 31,
    :green          => 32,
    :yellow         => 33,
    :blue           => 34,
    :magenta        => 35,
    :cyan           => 36,
    :white          => 37,
  }.each do |key, value|
    define_method key do
      "\e[#{value}m" + self + "\e[0m"
    end
  end
end
