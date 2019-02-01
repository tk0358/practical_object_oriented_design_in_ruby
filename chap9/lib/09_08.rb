# 9.5 ダックタイプをテストする - ロールを使ったダブルのバリエーション
# 「夢の世界に生きる」問題を解決

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def gear_inches
    # 'wheel' 変数内のオブジェクトが
    # 'Diameterizable' ロールを担う
    ratio * wheel.width  # テスト失敗2によって、ついに、'diameter'ではなく'width'に
  end

  def ratio
    chainring / cog.to_f
  end
  # ...
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def width
    rim + (tire * 2)
  end
  # ...
end
