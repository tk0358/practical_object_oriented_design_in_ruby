class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @pats = args[:parts]
  end

  def spares
    parts.spares
  end
end
