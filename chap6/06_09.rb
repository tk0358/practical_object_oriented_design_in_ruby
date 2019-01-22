# 6.5 スーパークラスとサブクラス間の結合度を管理する
# ◯ 結合度を理解する
class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size = args[:size]
    @chain = args[:chain]         || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def spares
    { chain: chain,
      tire_size: tire_size }
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError,
          "This #{self.class} cannnot respond to:"
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def spares
    super.merge({ tape_color: tape_color})
  end

  def default_tire_size
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

  def default_tire_size
    '2.1'
  end
end

class RecumbentBike < Bicycle
  attr_reader :flag

  def initialize(args)
    @flag = args[:flag]   # 'super' を送信するのを忘れた
  end

  def spares
    super.maerge({flag: flag})
  end

  def default_chain
    '9-speed'
  end

  def default_tire_size
    '28'
  end
end

bent = RecumbentBike.new(flag: 'tall and orange')
p bent.spares  # super を送信しわすれたので、tire_size と chain が初期化
