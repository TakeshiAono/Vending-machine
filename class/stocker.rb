class Stocker
  include Drinks
  attr_accessor :drinks, :can_buy_list

  def initialize(parent_obj)
    @drinks = {cola: cola,water: water, redbull: redbull}
    @can_buy_list = Array.new
    @parent = parent_obj
  end

  def buy(drink)
    drink = drink.to_sym
    @drinks[drink][:volume] -= 1
    @parent.input_money -= @drinks[drink][:price]
  end

  def stocks_info
    @drinks.each do |drink, info|
      puts "商品名:#{drink} 価格:#{info[:price]} 在庫数：#{info[:volume]}"
    end
  end

  def can_buy_list_up
    @can_buy_list.clear
    @drinks.each do |drink, info|
      @can_buy_list << drink.to_s if info[:volume] != 0 && info[:price] <= @parent.input_money
    end
    return
  end

end