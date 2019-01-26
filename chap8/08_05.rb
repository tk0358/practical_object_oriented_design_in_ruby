# 8.2
# Partsオブジェクトをもっと配列のようにする
# PartsをArrayのサブクラスにした場合

class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

class Parts < Array
  def spares
    select{|part| part.needs_spare}  # <- PartsがArrayのサブクラスになったので、レシーバなしでselectを呼び出せる
  end
end

class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end
end

chain =
  Part.new(name: 'chain', description: '10-speed')

road_tire =
  Part.new(name: 'tire_size', description: '23')

tape =
  Part.new(name: 'tape_color', description: 'red')

mountain_tire =
  Part.new(name: 'tire_size', description: '2.1')

rear_shock =
  Part.new(name: 'rear_shock', description: 'Fox')

front_shock =
  Part.new(name: 'front_shock', description: 'Maintou', needs_spare: false)

road_bike_parts =
  Parts.new([chain, road_tire, tape])

road_bike =
  Bicycle.new(
    size: 'L',
    parts: Parts.new([chain, road_tire, tape])
  )

mountain_bike =
  Bicycle.new(
    size: 'L',
    parts: Parts.new([chain, mountain_tire, front_shock, rear_shock])
  )

# Parts は '+' をArrayから継承するため、
# ２つの Parts は加え合わせられる
combo_parts =
  (mountain_bike.parts + road_bike.parts)

# '+' は間違いなく　Parts を組み合わせる
p combo_parts.size

# しかし '+' が返すオブジェクトは
# Arrayクラスなため
# 'spares' を理解しない
combo_parts.spares  # -> NoMethodError

p mountain_bike.parts.class
p road_bike.parts.class
p combo_parts.class
