class Gambler < Object
	attr_reader :username , :password, :saldo
	def initialize
		@username = "John Doe"
		@password
		@saldo = 0.0
	end

	def setUsername(usr)
		@username = usr
	end

	def setPassword(passwd)
		@password = passwd
	end

	def setSaldo(saldo)
		@saldo = saldo
	end

end