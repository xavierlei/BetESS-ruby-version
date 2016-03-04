#require_relative 'Facade.rb'
class UI < Object
	def initialize
		@on = true
		@logged = false
	end

	def printMenuLogin
		puts "register [username] [password]"
		puts "login [username] [password]"
		puts "exit"
	end

	def printMenuGambler
		puts "list events"
		puts "bet [event_id] [result] [value]"
		puts "mybets"
		puts "setings"
		puts "exit"
	end

	def printMenuBookie
		puts "list events"
		puts "myevents"
		puts "observe [event_id]"
		puts "update [event_id]"
		puts "close [event_id]"
		puts "setings"
		puts "exit"

	def loggedGambler
		while @logged && @on do
			#############
		end
	end

	def loggedBookie
		while @logged && @on do
			#############
		end
	end

	def notLogged
		while @logged && @on do
			#####
		end
	end

	def commandLine
		while @on do
			self.menuLogin
			cmd = gets.chomp
		end
	end
end