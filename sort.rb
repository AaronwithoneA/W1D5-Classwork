
def quick_sort(arr)
  return arr if arr.length <= 1
  new_arr = arr.dup
  compare = new_arr.shift
  less, more = [], []
  new_arr.each do |el|
    if el > compare
      less << el
    else
      more << el
    end
  end
  quick_sort(less) + [compare] + quick_sort(more)

end
a = [9,4,7,1,2,2,1]
p quick_sort(a)
