module Enumerable
  def my_each
    raise TypeError.new("can't iterate range input") if self.is_a?(Range) && !self.begin.respond_to?(:succ)
    return self.enum_for(:my_each) unless block_given?
    0.upto(self.size - 1) { |i| yield(self.to_a[i]) }
    self
  end

  def my_each_with_index
    
  end
end