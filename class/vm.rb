class VendingMachine
  attr_accessor :drinks, :input_money, :seles

  MONEY = [10, 50, 100, 500, 1000]

  def initialize
    @input_money = 0
    @stocker = Stocker.new
    @money_maneger = MoneyManager.new(@stocker)
    @input_info
  end

  def input(money)
    @money_maneger.input(money)
  end



  # def input_setting(money)#もし投入額が定数じゃなかったら投入額をそのまま返す投入額が定数だったら11行目を実行
  #   @input_money += money
  #   puts MONEY.include?(money) ? @stocker.stocker_input_money += @input_money : "#{money}円は使えねーよ！"
  #   @input_money = 0
  # end

  def input_back
    puts @stocker.stocker_input_money
    @stocker.stocker_input_money = 0
  end

  def seles_check
    puts @stocker.seles
  end

  def user_select_drinks(drink)
    @stocker.can_buy(drink)
  end

  def select_display(option_num)
    if option_num == 1
      @stocker.stocks_info
    elsif option_num == 2
      @stocker.can_buy_list
    else
      puts "定義されていない入力値です。在庫確認は1、購入できるドリンクの確認は2を入力してください"
    end
  end

end
