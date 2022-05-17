module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |val|
      yield val, index
      index += 1
    end
  end

  def my_select(&block)
    filtered = []
    my_each { |val| filtered << val if block.call(val) }
    filtered.my_each { |num| num }
  end

  def my_all?(&block)
    my_each { |val| return false unless block.call(val) }
    true
  end

  def my_any?(&block)
    my_each { |val| return true if block.call(val) }
    false
  end

  def my_none?(&block)
    my_each { |val| return false if block.call(val) }
    true
  end

  def my_count(&block)
    count = 0
    if block_given?
      my_each { |val| count += 1 if block.call(val) }
    else
      my_each { count += 1 }
    end
    count
  end

  def my_map(&block)
    filtered = []
    my_each { |val| filtered << block.call(val) }
    filtered.my_each { |num| num }
  end

  def my_inject(arg, &block)
    my_each { |val| arg = block.call(arg, val) }
    arg
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array

  def my_each
    holding = []
    count = 0
    until count == length
      yield at(count)
      holding << at(count)
      count += 1
    end
    holding
  end

end
