#some random comments
module subject
	attr_reader :observers
	def initialize
		@observers = []
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
	def notifyObservers(message)
		@observer.each{|observer| observer.update(message)}
	end
=begin
	def notifyObservers
		@observer.each{|observer| observer.update(self)} #põe-se o self para enviar o propio subject
	end
=end
end
