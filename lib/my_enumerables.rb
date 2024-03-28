# Module
module Enumerable
  # Your code goes here
  def my_each
    arr_length = length
    for i in 0...arr_length
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    arr_length = length
    for i in 0...arr_length
      yield([self[i],i])
    end
    self
  end

  def my_select
    new_arr = []
    each do |element|
      new_arr << element if yield(element) == true
    end
    new_arr
  end

  def my_all?
    new_arr = []
    each { |element| new_arr << yield(element) }
    p new_arr
    case new_arr
    in [*pre, false, *post]
      false
    else
      true
    end
  end

  def my_any?
    new_arr = []
    each { |element| new_arr << yield(element) }
    p new_arr
    case new_arr
    in [*pre, true, *post]
      true
    else
      false
    end
  end

  def my_none?
    new_arr = []
    each { |element| new_arr << yield(element) }
    p new_arr
    case new_arr
    in [*pre, true, *post]
      false
    else
      true
    end
  end

  def my_count
    count = 0
    if block_given?
      each do |element|
        count += 1 if yield(element)
      end
    else
      count = size
    end
    count
  end

  def my_map
    new_arr = []
    each { |element| new_arr << yield(element) }
    new_arr
  end

  def my_inject(initial_value)
    new_value = initial_value
    for i in (0...length) do
      new_value = yield(new_value, self[i])
    end
    new_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  array = [1, 2, 3, 4]
  # Define my_each here
  # array.my_select(&:even?)
  # array.my_all? { |element| element > 2 }
  # array.my_none? { |element| element == 5 }
  # array.my_count { |element| element > 2 }
  # array.my_map { |element| element * element }
  result = array.my_inject(1) { |product, n| product * n }
end
