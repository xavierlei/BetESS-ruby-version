require_relative "Facade.rb"
require_relative "GamblerController.rb"

facade = Facade.new
ana = facade.gamblerLogin("ana", "123")
print "userName = #{ana.model.username}"
