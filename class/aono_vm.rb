class VendingMachine
  include Drinks
  attr_accessor :drinks, :input_money, :seles

MONEY = [10, 50, 100, 500, 1000]

  def initialize
    @input_money = 0
    @drinks = {cola: cola,water: water, redbull: redbull}
    @seles = 0
  end

  def input_setting(money)#もし投入額が定数じゃなかったら投入額をそのまま返す投入額が定数だったら11行目を実行
    if MONEY.include?(money)
    @input_money += money
    else
      puts "#{money}円は使えねーよ！"
    end
  end

  def input_back
    puts @input_money
    @input_money = 0
  end

  def stocks_info
    @drinks.each do |drink, info|
        puts "商品名:#{drink} 価格:#{info[:price]} 在庫数：#{info[:value]}"
    end
  end

  def can_buy(drink)
    drink = drink.to_sym
    if @input_money >= @drinks[drink][:price] && @drinks[drink][:volume] > 0
      puts "You get #{drink}!"
      puts @drinks[drink][:volume] -= 1
      @input_money -= @drinks[drink][:price]
      seles_sum(drink)
      input_back
    else
      puts "You don't get!"
    end
  end

  def seles_sum(drink)
    drink = drink.to_sym
    @seles += @drinks[drink][:price]
  end

  def can_buy_list
    @drinks.each do |drink, info|
      puts drink if @drinks[drink][:volume] != 0 && @drinks[drink][:price] <= @input_money
    end
  end

end
