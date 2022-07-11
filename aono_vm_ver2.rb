class Drinks

MONEY = [10, 50, 100, 500, 1000]

  def initialize
    @drinks = {}
  end

  def input_drink(drink_name, price, volume)
    @drinks[drink_name] = {price: price, volume: volume, name: drink_name}
    pp @drinks
  end

  def output(number)
    @drinks[number]
  end

end

# ドリンククラス
# ・飲み物の種類、金額、在庫数、ドリンクの追加

# バイヤー(購入者)クラス
# ・飲み物の選択
# ・投入金額

# 販売機 金額計算クラス
# ・売上計算
# ・釣銭出力

# 販売機 在庫管理クラス
# ・在庫管理