def my_min(arr)
  arr.each do |el1|
    min = true
    arr.each do |el2|
      min = false if el1 > el2
    end
    return el1 if min
  end
end

def my_min_2(arr)
  result = arr.first
  arr.each { |el| result = el if el <= result }
  result
end


##phase one solution:

def largest_continuous_sum(arr)
  largest = 0
  slice_size = 1
  while slice_size < arr.length
    arr.each_slice(slice_size).each do |slice|
      local_sum = slice.inject(:+)
      if local_sum > largest
        largest = local_sum
      end
    end
    slice_size += 1
  end
  largest
end


###phase 2 solution:

def phase2(arr)
  biggest = arr.first
  i, j = 0, 0
  while j < arr.length
    current_sum = arr[i..j].inject(:+)
    if current_sum < 0
      i = j + 1
      j = i
    end
    biggest = current_sum if current_sum >= biggest
    j += 1
  end
  biggest
end

list = [2, 3, -6, 7, -6, 7]
p phase2(list)
