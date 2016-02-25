class bet < Object
	attr_reader :value,:result,:odd,:gambler_id
	def initialize
		@value
		@result
		@gambler_id
		@odd
	end

	def setValue(value)
		@valor = value
	end

	def setResult(result)
		@result = result
	end

	def setGambler(gambler_id)
		@gambler_id = gambler_id
	end

	def setOdd(odd)
		@odd = odd
	end

end
