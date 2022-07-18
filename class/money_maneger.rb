class MoneyManager
  attr_accessor :input_money_info, :output_money_info, :seles

  def initialize(parent_obj, stocker_obj)
    @input_money_info
    @input_money
    @outoput_info
    @seles = 0
    @stocker = stocker_obj
    @parent = parent_obj
  end

  def input(money)
    @input_money_info = money
    unless input_confirm
      puts "X  #{@input_money_info}は投入できません。" 
    else
      puts "O  #{@input_money_info}円投入しました。"
      @parent.input_money += @input_money_info
    end
  end

  def can_buy?(object, money)
    @stocker.drinks[object][:price] <= money ? true : false
  end

  def seles_add(drink)
    drink = drink.to_sym
    @seles += @stocker.drinks[drink][:price]
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