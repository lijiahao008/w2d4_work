

def string_permutations(str)

  ###time complexity of O(n!)

  return [""] if str.length == 0
  first = str[0]
  rest = string_permutations(str[1..-1])
  perms = []
  rest.each do |perm|
    0.upto(perm.length) do |i|
      perms << perm[0...i] + first + perm[i..-1]
    end
  end
  perms
end

def first_anagram?(str1, str2)
  string_permutations(str1).include?(str2)
end

def second_anagram?(str1, str2)

  ##time complexity of O(n^2)

  ###wont work if
  return false unless str1.length == str2.length
  result1 = str1.chars
  result2 = str2.chars

  str1.chars.each do |char1|
    if str2.chars.include?(char1)
      result1.delete(char1)
      result2.delete(char1)
    end
  end

  result1.empty? && result2.empty?
end

def third_anagram?(str1, str2)
  ###time complexity of O(nlogn)
  str1.chars.my_merge_sort == str2.chars.my_merge_sort
end


class Array

  def my_merge_sort(&prc)
    prc ||= Proc.new() {|x,y| x <=> y }
    return self if self.size == 1

    mid = self.length / 2

    left = self.take(mid).my_merge_sort(&prc)
    right = self.drop(mid).my_merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private

  def self.merge(left, right, &prc)
    merged = []

    until (left.empty? || right.empty?)
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end

end

def fourth_anagram?(str1, str2)

  ###time complexity of O(n)
  hash_index(str1) == hash_index(str2)
end

def hash_index(str)
  hash = Hash.new{ |h, k| h[k] = 0}

  str.chars.each do |char|
    hash[char] += 1
  end

  hash
end




p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")
