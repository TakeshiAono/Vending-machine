class Stocker
  include Drinks
  attr_accessor :stocker_input_money

  def initialize
    @drinks = {cola: cola,water: water, redbull: redbull}
    @stocker_input_money = 0
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

  def stocks_info
    @drinks.each do |drink, info|
      puts "商品名:#{drink} 価格:#{info[:price]} 在庫数：#{info[:volume]}"
    end
  end

  def can_buy_list
    @drinks.each do |drink, info|
      puts drink if info[:volume] != 0 && info[:price] <= @input_money
    end
  end

  # private
  # def get_input_money
  #   #VendingMachineオブジェクトから取得した（与えられるのではなく取得したい）
  # end

end