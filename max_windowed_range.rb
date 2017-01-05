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
