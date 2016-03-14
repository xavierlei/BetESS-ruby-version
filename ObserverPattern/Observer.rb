module Observer
	def initialize
		@notifications = Array.new
	end
	def updateObserver(message)
		@notifications.push(message)
	end
	
end
