class MyHash
  def initialize
    @array = Array.new(64)
  end

  def find_index(key)
    return (key.hash % 63)
  end

  def [](key)
    return @array[self.find_index(key)]
  end

  def []=(key, value)
    @array[self.find_index(key)] = value
  end


end
