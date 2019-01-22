# 6.4 継承を見つける
# ◯ 抽象的なスーパークラスをつくる（最初の一歩）
class Bicycle
  # このクラスはもはや空となった
  # コードはすべて RoadBike に移された
end

class RoadBike < Bicycle
  # いまは Bicycle のサブクラス
  # かつての Bicycle クラスからのコードをすべて含む
  attr_reader :size, :tape_color

  def initialize(args)
    @size = args[:size]
    @tape_color = args[:tape_color]
  end

  def spares
    { chain:  '10-speed',
      tire_size: '23',
      tape_color: tape_color}
  end
end

class MountainBike < Bicycle
  # Bicycle のサブクラスのまま（Bicycle は現在空になっている）
  # コードは何も変更されていない
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
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
p mountain_bike.size # MountainBike クラスとそのスーパークラスにsizeが実装されていないから、例外発生
