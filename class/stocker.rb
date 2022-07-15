class Stocker
  include Drinks
  attr_accessor :stocker_input_money, :seles

  def initialize
    @drinks = {cola: cola,water: water, redbull: redbull}
    @stocker_input_money = 0
    @seles = 0
  end
  
  def can_buy(drink)
    drink = drink.to_sym
    if @stocker_input_money >= @drinks[drink][:price] && @drinks[drink][:volume] > 0
      puts "You get #{drink}!"
      puts @drinks[drink][:volume] -= 1
      @stocker_input_money -= @drinks[drink][:price]
      seles_sum(drink)
      puts @stocker_input_money
      @stocker_input_money = 0
    else
      puts "You don't get!"
    end
  end

  def stocks_info
    @drinks.each do |drink, info|
      puts "商品名:#{drink} 価格:#{info[:price]} 在庫数：#{info[:volume]}"
    end
  end

  def can_buy_list
    @drinks.each do |drink, info|
      puts drink if info[:volume] != 0 && info[:price] <= @stocker_input_money
    end
  end

  def seles_sum(drink)
    drink = drink.to_sym
    @seles += @drinks[drink][:price]
  end

end