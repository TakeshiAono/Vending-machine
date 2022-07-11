class VendingMachine

MONEY = [10, 50, 100, 500, 1000]

  def initialize
    @input_money = 0
    @drinks = {cola: {price: 120, volume: 5, name: "コーラ"}, water: {price: 100, volume: 5, name: "お水" }, redbull: {price: 200, volume: 5, name: "レッドブル" }}
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
        info.each do |key, value|
        puts "#{drink}の#{key}は#{value}です"
      end
    end
  end

  def can_buy_cola
    if @input_money >= @drinks[:cola][:price] && @drinks[:cola][:volume] > 0
      puts "You get cola!"
      puts @drinks[:cola][:volume] -= 1
      @input_money -= @drinks[:cola][:price]
      seles_sum
      input_back
    else
      puts "You don't get!"
    end
  end

  def seles_sum
    @seles += @drinks[:cola][:price]
  end

  def can_buy_list
    @drinks.each do |drink, info|
      puts drink if @drinks[drink][:volume] != 0 && @drinks[drink][:price] <= @input_money
    end
  end

end
