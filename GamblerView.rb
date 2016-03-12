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
		saldo = gets.chomp
		while (saldo =~ /^\d+$/).nil?
			puts "Error: you must enter a numeric value\n"
			puts "type your BetCoin credit"
			saldo = gets.chomp
		end
		res = [username,passwd,$&.to_f]
	end

	def updateView
		puts "type your new password"
		passwd = gets.chomp
		puts "type your credit"
		saldo = gets.chomp.to_f
		res = [passwd,saldo]
	end

	def showNotification(message)
		puts message
	end

end
