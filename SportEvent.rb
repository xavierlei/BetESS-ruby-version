class SportEvent < Object
	attr_reader :event_id,:state,:team1,:team2,:result,:odd,:owner_id
	def initialize(owner, event_id)
		@event_id = event_id
		@state = false
		@team1
		@team2
		@result = "-"
		@odd = [1.0,1.0,1.0]
		@owner_id = owner
	end

	def setTeam1(team)
		@team1 = team
	end
	def setState(state)
		@state = state
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
