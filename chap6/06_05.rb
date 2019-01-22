# 6.4 継承を見つける
# ◯ 抽象的な振る舞いを昇格させる
class Bicycle
  attr_reader :size   # <- RoadBike から昇格した

  def initialize(args={})
    @size = args[:size]  # <- RoadBike から昇格した
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)  # <- RoadBikeは'super'を必ず呼ばなければならなくなった
  end

  def spares
    { chain:  '10-speed',
      tire_size: '23',
      tape_color: tape_color}
  end
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

road_bike = RoadBike.new(
              size: 'M',
              tape_color: 'red')
p road_bike.size

mountain_bike = MountainBike.new(
                  size: 'S',
                  front_shock: 'Maintou',
                  rear_shock: 'Fox')
p mountain_bike.size # sizeに正しく応答するように
