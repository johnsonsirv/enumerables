module Enumerable
  def my_each
    return self.enum_for(:my_each) unless block_given?
    self
  end
end