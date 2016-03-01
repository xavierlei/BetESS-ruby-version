class BetView < Object
	def printView(value,result,gambler_id,odd)
		puts "value: #{value}"
		puts "result: #{result}"
		puts "gambler_id: #{gambler_id}"
		puts "odd: #{odd[0]} #{odd[1]} #{odd[2]}"
	end
	def createView
		puts "insert bet value"
		value = gets.chomp.to_f
		puts "insert bet result"
		result = gets.chomp
		res = [value,result]
	end
end