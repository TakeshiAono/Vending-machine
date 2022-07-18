Dir[File.dirname(__FILE__) + '/module/*.rb'].each {|file| require file}
Dir[File.dirname(__FILE__) + '/class/*.rb'].each {|file| require file}


# dydo = VendingMachine.new
# dydo.input_setting(100)
# dydo.user_select_drinks("water")
# dydo.select_display(1)