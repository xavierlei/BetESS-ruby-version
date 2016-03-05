class Bookie < Object
	attr_reader :username , :password
	def initialize
		@username = "Joe Spagheti O's"
		@password
	end
	def setUsername(username)
		@username = username
	end
	def setPassword(password)
		@password = password
	end
end
