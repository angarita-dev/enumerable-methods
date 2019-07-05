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

  def my_all?
    for i in (0...self.length)
      result = yield(self[i])
      if result == nil || result == false
        return false
      end
    end 
    return true
  end

  def my_none?
    for i in (0...self.length)
      result = yield(self[i])
      if result == nil || result == false
        return false
      end
    end 
    return true
  end

  def my_count
    counter = 0
    for i in (0...self.length)
      result = yield(self[i])
      if result == true
        counter += 1
      end
    end 
    return counter
  end

  def my_map (proc=nil)
    for i in (0...self.length)
      unless proc
        self[i] = yield(self[i])
      else
        self[i] = proc.call(self[i])
      end
    end 
    return self
  end

  def my_inject 
    counter = self[0]
    for i in (1...self.length)
      result = yield(counter,self[i])
      counter = result
    end
    return counter
  end

  def multiply_els 
    return self.my_inject {|counter,nexti| counter * nexti}
  end

end

