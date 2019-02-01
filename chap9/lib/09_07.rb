# 夢の世界に生きる」問題の例
# Diameterizable(Wheel)のインターフェースが変わり、diameter→widthになった。
# それなのにGearとテストダブルのインターフェースが古いdiameterのままの場合、
# テストが失敗すべきなのに、成功してしまう

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
    ratio * wheel.diameter  # 実際のDiameterizableのインターフェースはwidthなのにGearはdiameterのまま
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

  def width  # Diameterizableインターフェースがdiameteer → width に変更
    rim + (tire * 2)
  end
  # ...
end
