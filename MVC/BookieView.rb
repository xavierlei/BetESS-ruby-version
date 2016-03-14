class BookieView < Object
	def printView(username,password)
		puts "bookie name: #{username}"
		puts "password #{password}"
	end
	def createView
		puts "type bookie username"
		usr = gets.chomp
		puts "type your password"
		passwd = gets.chomp
		data = [usr,passwd]
	end
	def updateView
		puts "type your new password"
		password = gets.chomp
	end
	def showNotification(msg)
		puts msg
	end
end
