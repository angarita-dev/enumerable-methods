# This custom Enumerable module replicates the work of the default Enumerable methods 
module Enumerable
  def my_each
    for i in (0...self.length)
      yield(self[i])
    end 
  end

  def my_each_with_index
    for i in (0...self.length)
      yield(self[i],i)
    end 
  end

  def my_select 
    result []
    self.each do |current|
      result.push self[i] if yield(current)
    end
    return result
  end

  def my_all?
    self.each do |current|
      result = yield(current)
      if result == nil || result == false
        return false
      end
    end 
    return true
  end

  def my_none?
    self.each do |current|
      result = yield(current)
      if result == nil || result == false
        return false
      end
    end 
    return true
  end

  def my_count
    counter = 0
    self.each do |current|
      result = yield(current)
      if result == true
        counter += 1
      end
    end 
    return counter
  end

  def my_map (proc=nil)
    self.each do |current|
      unless proc
        self[i] = yield(current)
      else
        self[i] = proc.call(current)
      end
    end 
    return self
  end

  def my_inject 
    counter = self[0]
    self.each do |current|
      result = yield(counter,current)
      counter = result
    end
    return counter
  end

  def multiply_els 
    return self.my_inject {|counter,nexti| counter * nexti}
  end

end

p = Proc.new { |c|
  c+5
}

print [2,4,5].my_all? { |c|
  c < 5
}