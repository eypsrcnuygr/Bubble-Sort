# frozen_string_literal: true

require 'pry'

def swap!(arr, idx1, idx2)
  arr[idx1], arr[idx2] = arr[idx2], arr[idx1]
end

def bubble_sort(arr)
  arr.each_with_index do |_item, _i|
    arr.each_with_index do |_item, j|
      next if j == arr.length - 1

      swap!(arr, j, j + 1) if arr[j] > arr[j + 1]
    end
  end
  arr
end

def bubble_sort_by(arr)
  count = 0
  while count < arr.length - 1
    (0..arr.length - 2).each do |i|
      swap!(arr, i, i + 1) if (yield arr[i], arr[i + 1]).positive?
    end
    count += 1
  end
  arr
end

p(bubble_sort([12, 15, 7, 28, 52, 100, 67, 4]))

p(bubble_sort_by(%w[hi hello hey]) { |left, right| left.length - right.length })
