class Gambler < Object
	attr_reader :username , :password, :coins, :notifications
	def initialize
		@username = "John Doe"
		@password
		@coins = 0.0
		@notifications = []
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

	def addNotification(message)
		@notifications.push(message)
	end

end
