class SportEvent < Object
	attr_reader :team1,:team2,:result,:odd
	def initialize
		@team1
		@team2
		@result = "-"
		@odd = [1.0,1.0,1.0]
	end

	def setTeam1(team)
		@team1 = team
	end

	def setTeam2(team)
		@team2 = team
	end

	def setOdd(odd)
		@odd = odd
	end

	def setResult(result)
		@result = result
	end

end