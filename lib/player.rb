class Player

  def initialize(attributes)
    @attributes = attributes
  end

  def name
    @attributes[:name]
  end

  def position
    @attributes[:position]
  end

end
