module Enumerable
  def my_each
    return self.enum_for(:my_each) unless block_given?
    0.upto(self.size - 1) { |i| yield(self.to_a[i]) }
    self
  end
end