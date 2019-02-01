# 「夢の世界に生きる」問題の例
# Diameterizable(Wheel)のインターフェースが変わり、diameter→widthになった。
# それなのにGearとテストダブルのインターフェースが古いdiameterのままの場合、
# テストが失敗すべきなのに、成功してしまう

require_relative '../lib/09_07'
require 'minitest/autorun'

class DiameterDouble
  def diameter  # <- 実際のDiameterizableインターフェースはwidthに変わっているのにそのまま...
    10
  end
end

class GearTest < Minitest::Unit::TestCase
  # 失敗すべきテストなのに成功してしまう（夢の世界に生きる）
  def test_calculates_gear_inches
    gear = Gear.new(
            chainring: 52,
            cog: 11,
            wheel: DiameterDouble.new
    )

    assert_in_delta(47.27, gear.gear_inches, 0.01)
  end
end

# Wheelテストは正しいテスト
class WheelTest < Minitest::Unit::TestCase
  def setup
    @wheel = Wheel.new(26, 1.5)
  end

  # Wheel が width を実装するDiameterizableのように振る舞うことを証明
  def test_implements_the_diameterizable_interface
    assert_respond_to(@wheel, :width)
  end

  def test_calculates_diameter
    wheel = Wheel.new(26, 1.5)

    assert_in_delta(29, wheel.width, 0.01)
  end
end
