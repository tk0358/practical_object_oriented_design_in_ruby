# 9.6 継承されたコードをテストする
# ◯ 継承されたインターフェースを規定する
# 06_10.rb からの抜粋

class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size = args[:size]
    @chain = args[:chain]         || default_chain
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args)
  end

  def spares
    { chain: chain,
      tire_size: tire_size }.merge(local_spares)
  end

  def default_tire_size
    raise NotImplementedError
  end

  # subclass may override
  def post_initialize(args)
    nil
  end

  def local_spares
    {}
  end

  def default_chain
    '10-speed'
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def local_spares
    {tape_color: tape_color}
  end

  def default_tire_size
    '23'
  end
end
