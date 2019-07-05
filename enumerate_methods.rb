module Enumerable
  def my_each
    for i in (0...self.length)
      yield self[i]
    end 
  end

  def my_each_with_index
    for i in (0...self.length)
      yield self[i], i
    end 
  end

  def my_select 
    result []
    for i in (0...self.length)
      result.push self[i] if yield self[i]
    end
    return result
  end
end