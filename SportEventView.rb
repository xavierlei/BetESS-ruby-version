class SportEventView < Object

	def printView(event_id,state,team1,team2,odd,result)
		puts " ______________"
		puts " id: #{event_id}"
		puts " state: #{state}"
		puts " #{team1} X #{team2}"
		puts " odds = {#{odd[0]},#{odd[1]},#{odd[2]}}"
		puts " result = #{result}"
		puts " ______________"
	end

	def createView
		puts "input team1"
		team1 = gets.chomp
		puts "input team2"
		team2 = gets.chomp
		puts "input odd for team 1"
		o1 = gets.chomp
		puts "input odd for draw"
		od = gets.chomp
		puts "input odd for team 2"
		o2 = gets.chomp
		res = [team1,team2,[o1,od,o2]]
	end

	def updateOdd
		puts "input new odd for team 1"
		o1 = gets.chomp
		puts "input new odd for draw"
		od = gets.chomp
		puts "input new odd for team 2"
		o2 = gets.chomp
		res = [o1,od,o2]
	end

	def updateState
		puts "input event state [open | closed]"
		s = gets.chomp
		to_boolean(s)
	end

	def to_boolean(str)
  	str == 'open'
  end

	def setResult
		puts "input the ending result [win | draw | loss]"
		return gets.chomp
	end

end
