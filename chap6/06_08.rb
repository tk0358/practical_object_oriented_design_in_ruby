# 6.4 継承を見つける
# ◯ すべてのテンプレートメソッドを実装する
class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size = args[:size]
    @chain = args[:chain]         || default_chain      # <- 変更箇所
    @tire_size = args[:tire_size] || default_tire_size  # <- 変更箇所
  end

  def default_chain  # <- 共通の初期値
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError,
          "This #{self.class} cannnot respond to:"
  end
end

class RecumbentBike < Bicycle
  def default_chain
    '9-speed'
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def spares
    { chain:  '10-speed',
      tire_size: '23',
      tape_color: tape_color}
  end

  def default_tire_size  # <- サブクラスの初期値
    '23'
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

  def default_tire_size  # <- サブクラスの初期値
    '2.1'
  end
end

bent = RecumbentBike.new
