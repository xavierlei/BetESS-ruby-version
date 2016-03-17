#some random comments
module Subject
	attr_reader :observers
	def initialize
		@observers = Array.new
	end

	def addObserver(observer)
		unless observers.include?(observer)
			@observers.push(observer)
		end
	end

	def deleteObserver(observer)
		@observer.delete(observer)
	end

	def deleteObservers
		@observers = []
	end
	def notifyObserver(observer,message)
		@observers.each do|obj|
			if obj == observer
				obj.updateObserver(message)
			end
		end
	end
	def notifyAllObservers(message)
			@observers.each{|observer| observer.updateObserver(message)}
	end
end
