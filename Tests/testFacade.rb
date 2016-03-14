require_relative "../Facade.rb"
require_relative "../MCV/GamblerController.rb"

facade = Facade.new

#facade.listarBookies


#Gambler Register
#luis = facade.registerGambler
#luis = facade.gamblerLogin("luis","123")



#Gambler Login
ana = facade.gamblerLogin("joaquim", "123")
afonso = facade.gamblerLogin("afonso", "123")
print " \tUserName = #{afonso.model.username}\n"


#Bookie Login
rui = facade.bookieLogin("rui","123")
print " \tUserName = #{rui.model.username}\n"

facade.openEvent(1)
#facade.newEvent("rui")
#facade.newEvent("rui")
facade.listEvents('rui')


facade.placeBet(1,"afonso")
#facade.placeBet(1,"afonso")
#facade.placeBet(1,"afonso")
afonso.printBets
facade.endEvent(1)

afonso.readAllNotifications

ana.readAllNotifications
