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
		while (saldo =~ /^\d+(.\d{2})?$/).nil?
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
		saldo = gets.chomp
		while (saldo =~ /^\d+(.\d{2})?$/).nil?
			puts "Error: you must enter a numeric value\n"
			puts "type your BetCoin credit"
			saldo = gets.chomp
		end
		res = [passwd,$&.to_f]
	end

	def showNotification(msg)
		puts msg
	end

	def showProfileInfo(username,pass,coins)
		puts "***Profile Info.***"
		puts " UserName: #{username}"
		puts " Pass: #{pass}"
		puts " Coins: #{coins}"
	end
end
