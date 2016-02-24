class bet < Object
	attr_reader :velue,:result,:odd,:better
	def initialize
		@value
		@result
		@better
		@odd
	end

	def setValue(value)
		@valor = value
	end

	def setResult(result)
		@result = result
	end

	def setBetter(better)
		@better = better
	end

	def setOdd(odd)
		@odd = odd
	end

end