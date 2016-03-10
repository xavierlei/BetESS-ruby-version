require_relative 'Facade.rb'
class UI < Object

	def initialize
		@on = true
		@logged = false
		@facade = Facade.new
		@session 
	end

	def printMenuLogin
		puts "register [bookie | gambler]"
		puts "login [bookie | gambler] [username] [password]"
		puts "exit"
	end

	def printMenuGambler
		puts "list events"
		puts "bet [event_id] [result] [value]"
		puts "mybets"
		puts "setings"
		puts "exit"
		print "gambler>"

	end

	def printMenuBookie
		puts "list events"
		puts "myevents"
		puts "observe [event_id]"
		puts "update [event_id]"
		puts "close [event_id]"
		puts "setings"
		puts "exit"
		print "bookie>"
		#$stdout.flush
	end

	def loggedGambler
		while @logged && @on do
			self.printMenuGambler
			cmd = gets.chomp
			puts cmd
		end
	end

	def loggedBookie
		while @logged && @on do
			self.printMenuBookie
			cmd = gets.chomp
			puts cmd
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
		while @on do
			self.printMenuLogin
			cmd = gets.chomp.split(" ")
			if !(cmd.empty?)
				case cmd[0]
				when "register"
					register(cmd)
				when "login"
					login(cmd)
				when "exit"
					@on = false
				else
					puts "syntax error"
				end		
			end
		end
	end

end
