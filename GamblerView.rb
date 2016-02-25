class GamblerView < Object

	def printView(usr,saldo)
		puts usr
		puts saldo
	end

	def createView
		puts "type your username"
		username = gets.chomp
		puts "type you password"
		passwd = gets.chomp
		puts "type your BetCoin credit"
		saldo = gets.chomp.to_f
		res = [username,passwd,saldo]
	end

	def updateView
		puts "type your new password"
		passwd = gets.chomp
		puts "type your credit"
		saldo = gets.chomp.to_f
		res = [passwd,saldo]
	end

end