unsorted = [3, 9, 6, 5, 3, 10, 2, 1, 1]

def insertion_sort(arr)
  n = arr.length
  for i in 0...n
    cur = arr[i]
    for j in 0...i
      if cur < arr[j]
        tmp = cur
        arr.delete_at(i)
        arr.insert(j, tmp)
        break
      end
    end
  end
  return arr
end

def bubble_sort(arr)
  n = arr.length
  begin
    cursor = 0
    for j in 0...(n-1)
      cur_item = arr[j]
      next_item = arr[j+1]
      if cur_item > next_item 
        arr[j] = next_item
        arr[j+1] = cur_item
        cursor = j + 1
      end
    end
    n = cursor
  end while n > 1
  return arr
end

sorted = bubble_sort(unsorted)
puts sorted.join(', ')
