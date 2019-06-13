# frozen_string_literal: true

module Enumerable
  def my_each
    raise TypeError.new('can\'t iterate range input') if self.is_a?(Range) && !self.begin.respond_to?(:succ)
    return self.enum_for(:my_each) unless block_given?

    0.upto(self.size - 1) { |indx| yield(self.to_a[indx]) }
    self
  end

  def my_each_with_index
    raise NoMethodError.new('undefined method') if self.is_a?(Range)
    return self.enum_for(:my_each_with_index) unless block_given?

    0.upto(self.size - 1) { |indx| yield(indx) }

    self
  end

  def my_select
    raise TypeError.new('can\'t iterate range input') if self.is_a?(Range) && !self.begin.respond_to?(:succ)
    return self.enum_for(:my_select) unless block_given?

    output = []
    self.my_each { |elem| output << elem if yield(elem) }

    output
  end

  def my_all?(*args)
    raise TypeError.new('can\'t iterate range input') if self.is_a?(Range) && !self.begin.respond_to?(:succ)
    return self.grep(args.first).length == self.size unless args.empty?

    if block_given?
      self.my_each { |elem| return false unless yield(elem) }
    else
      self.my_each { |item| return false unless item }
    end

    true
  end

  def my_any?(*args)
    raise TypeError.new('can\'t iterate range input') if self.is_a?(Range) && !self.begin.respond_to?(:succ)
    return self.grep(args.first).length == self.size unless args.empty?

    if block_given?
      self.my_each { |elem| return true if yield(elem) }
    else
      self.my_each { |item| return true if item }
    end

    false
  end

  def my_none?(*args)
    raise TypeError.new('can\'t iterate range input') if self.is_a?(Range) && !self.begin.respond_to?(:succ)
    return self.grep(args.first).empty? unless args.empty?

    if block_given?
      self.my_each { |elem| return false if yield(elem) }
    else
      self.my_each { |item| return false if item }
    end

    true
  end

  def my_count(*args)
    return self.my_select { |elem| yield elem }.length if block_given?
    return self.my_select { |elem| elem.eql? args.first }.length unless args.empty?

    self.size
  end

  def my_inject(*initial_accum)
    raise LocalJumpError.new('no block given') unless block_given? || initial_accum.first.is_a?(Symbol)
    raise TypeError.new("can't iterate range input") if self.is_a?(Range) && !self.begin.respond_to?(:succ)
    self.define_singleton_method(:named_method) do |data, binary_op|
      acc = data.first
      1.upto(data.size - 1) do |i|
        acc = acc.send(binary_op, data[i])
      end
      acc
    end
    #respond to symbol method call 
    return method(:named_method).call(self.to_a, initial_accum.first.to_s) if initial_accum.first.is_a?(Symbol)
    
    if block_given?
      start = initial_accum.empty? ? 1 : 0
      acc = initial_accum.empty? ? self.to_a.first : initial_accum.first
      start.upto(self.size - 1) { |indx| acc = yield(acc, self.to_a[indx]) }
    end
    
    acc
  end

  def my_map(*proc)
    raise TypeError.new('argument expected to be proc - &proc') if !proc.empty? && !proc.first.is_a?(Proc)
    return self.enum_for(:my_map) unless block_given?

    output = []
    self.my_each { |elem| output << yield(elem) }
    output
  end
end

def multiply_els(arr)
  arr.my_inject { |prod, elem| prod * elem }
end
