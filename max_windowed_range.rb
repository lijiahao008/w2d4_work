require 'byebug'

def windowed_max_range(arr, window_size)

  ###time complexity potentially O(n^2)?? or O(n^2 * logn)
  current_max_range = 0
  start = 0
  while start + window_size < arr.length
    current_window = arr[start..(start + window_size) - 1]
    current_range = current_window.max - current_window.min
    # debugger
    current_max_range = current_range if current_range > current_max_range
    start += 1
  end
  current_max_range
end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4
p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4)# == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8


class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
    @biggest = nil
    @smallest = nil
  end

  def pop
    @store.pop
  end

  def push(el)
    if el > @biggest || @biggest.nil?
      @biggest = el
    elsif el < @smallest || @smallest.nil?
      @smallest = el
    end
    @store << el
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max
    @biggest
  end

  def min
    @smallest
  end

end


class StackQueue
  def initialize
    @pop_stack = MyStack.new
    @push_stack = MyStack.new
  end

  def enqueue(el)
    @push_stack.push(el)
    @pop_stack.push(el)
  end




end


class MaxMinQueue
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def enqueue(val)
    @store << val
  end

  def dequeue
    @store.shift
  end

  def peek
  end

  def size
  end

  def empty?
  end

end
