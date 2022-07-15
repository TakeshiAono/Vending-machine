class VendingMachine
  # include Drinks
  attr_accessor :drinks, :input_money, :seles

  MONEY = [10, 50, 100, 500, 1000]

  def initialize
    @input_money = 0
    @seles = 0
    @stocker = Stocker.new
  end

  def input_setting(money)#もし投入額が定数じゃなかったら投入額をそのまま返す投入額が定数だったら11行目を実行
    puts MONEY.include?(money) ? @stocker.input_money = @input_money += money : "#{money}円は使えねーよ！"
  end

  def input_back
    puts @input_money
    @input_money = 0
  end

  def seles_sum(drink)
    drink = drink.to_sym
    @seles += @drinks[drink][:price]
  end

  def select_drinks(drink)
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



  # def stocks_info
  #   @drinks.each do |drink, info|
  #     puts "商品名:#{drink} 価格:#{info[:price]} 在庫数：#{info[:volume]}"
  #   end
  # end

  # def can_buy(drink)
  #   drink = drink.to_sym
  #   if @input_money >= @drinks[drink][:price] && @drinks[drink][:volume] > 0
  #     puts "You get #{drink}!"
  #     puts @drinks[drink][:volume] -= 1
  #     @input_money -= @drinks[drink][:price]
  #     seles_sum(drink)
  #     input_back
  #   else
  #     puts "You don't get!"
  #   end
  # end


  # def can_buy_list
  #   @drinks.each do |drink, info|
  #     puts drink if info[:volume] != 0 && info[:price] <= @input_money
  #   end
  # end

end
