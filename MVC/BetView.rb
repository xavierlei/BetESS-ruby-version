class BetView < Object
	def printView(value,result,gambler_id,odd)
		puts "value: #{value}"
		puts "result: #{result}"
		puts "gambler_id: #{gambler_id}"
		puts "odd: #{odd[0]} #{odd[1]} #{odd[2]}"
	end
	def createView(credit)
		puts "insert bet value"
		value = gets.chomp
		while (value =~ /^\d+(.\d{2})?$/).nil?
			puts "Error: you must enter a numeric value\n"
			puts "type your BetCoin value"
			value = gets.chomp
		end
		value = $&.to_f
		if value > credit
			puts "insuficient funds! current credit: #{credit}"
		else
			puts "insert bet result [win | draw | loss]"
			result = gets.chomp
			while(validateBetResult(result)==0)
				puts "insert bet result [win | draw | loss]"
				result = gets.chomp
			end
		end
		res = [value,result]
	end

	def validateBetResult(string)
		case string
		when "win","draw","loss"
			return 1
		else
			return 0
		end
	end

end
