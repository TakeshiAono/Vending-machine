class VendingMachine
  attr_accessor :input_money

  MONEY = [10, 50, 100, 500, 1000]

  def initialize
    @input_money = 0
    @stocker = Stocker.new(self)
    @money_maneger = MoneyManager.new(self, @stocker)
  end

  def input(money)
    @money_maneger.input(money)
    @stocker.can_buy_list_up
    unless @stocker.can_buy_list.empty?
      puts "#{@stocker.can_buy_list}を購入できます"
    else
      puts "購入できる物はありません"
    end
  end

  def input_back
    puts @input_money
    @input_money = 0
  end

  def select_drinks(drink)
    drink = drink.to_sym
    return puts "その名前のドリンクは販売しておりません" unless @stocker.drinks.key?(drink)
    if @stocker.drinks[drink][:volume] == 0 || @money_maneger.can_buy?(drink, @input_money) == false
      puts "You don't get!"
    else
    puts "You get #{drink}!"
    @stocker.buy(drink)
    @money_maneger.seles_add(drink)
    puts "#{@input_money}円のお返しです"
    @input_money = 0
    end
  end
  
  def setting_display
    puts "在庫確認は「1」、売上確認は「2」を入力してください"
    option_num = gets.to_i
    if option_num == 1
      @stocker.stocks_info
    elsif option_num == 2
      seles_check
    else
      puts "定義されていない入力値です。在庫確認は1、購入できるドリンクの確認は2を入力してください"
    end
  end
  
  private
  def seles_check
    puts "売上#{@money_maneger.seles}円"
  end

end
