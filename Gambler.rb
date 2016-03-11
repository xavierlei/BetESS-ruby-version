class Gambler < Object
	attr_reader :username , :password, :coins
	def initialize
		@username = "John Doe"
		@password
		@coins = 0.0
	end

	def setUsername(usr)
		@username = usr
	end

	def setPassword(passwd)
		@password = passwd
	end

	def setCoins(coins)
		@coins = coins
	end

end