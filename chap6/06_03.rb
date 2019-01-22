# 6.3 継承を不適切に適用する
class Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size = args[:size]
    @tape_color = args[:tape_color]
  end

  # すべての自転車は、デフォルト値として
  # 同じタイヤサイズとチェーンサイズを持つ
  def spares
    { chain:  '10-speed',
      tire_size: '23',
      tape_color: tape_color}
  end

  # ほかにもメソッドがたくさん...
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge({rear_shock: rear_shock})
  end
end



mountain_bike = MountainBike.new(
                  size: 'S',
                  front_shock: 'Maintou',
                  rear_shock: 'Fox')

p mountain_bike.size

p mountain_bike.spares
