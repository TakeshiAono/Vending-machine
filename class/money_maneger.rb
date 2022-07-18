class MoneyManager
  attr_reader :input_money_info, :output_money_info

  def initialize(stocker_obj)
    # @obj = parent_obj
    @input_money_info
    @input_money
    @outoput_info
    @stocker = stocker_obj
    @input = stocker_obj
  end

  def input(money)
    @input_money_info = money
    unless input_confirm
      puts "#{@input_money_info}は投入できません。" 
    else
      @stocker.stocker_input_money += @input_money_info
    end
  end


  private
  def input_confirm
    if VendingMachine::MONEY.include?(@input_money_info)
      @input_money = @input_money_info
    else
      false
    end
  end

end