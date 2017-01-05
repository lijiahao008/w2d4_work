
def bad_two_sum?(arr, target_sum)
  #time complexity is O(n^2)
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end

  false
end


def okay_two_sum?(arr, target_sum)
  ###time complexity is O(nlogn) because of ruby build in sort method
  new_arr = arr.sort
  head, tail = 0, arr.length - 1
  until head == tail
    if arr[head] + arr[tail] == target_sum
      return true
    elsif arr[head] + arr[tail] > target_sum
      tail -= 1
    else
      head += 1
    end
  end
  false

end



def hash_map(arr, target)
  ###time complexity of O(n)
  map = Hash.new { |h, k| h[k] = false }
  arr.each do |el|
    return true if map[target -el]
    map[el] = true
  end

  false

end

arr = [0, 1, 5, 7, 5]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10)
p okay_two_sum?(arr, 8)
