class ApostadorView < Object

	def printView(usr,saldo)
		puts usr
		puts saldo
	end

	def createView
		puts "introduza o seu username"
		username = gets.chomp
		puts "introduza a sua password"
		passwd = gets.chomp
		puts "introduza o seu saldo"
		saldo = gets.chomp.to_f
		res = [username,passwd,saldo]
	end

	def updateView
		puts "introduza a sua nova password"
		passwd = gets.chomp
		puts "introduza o seu saldo"
		saldo = gets.chomp.to_f
		res = [passwd,saldo]
	end

end