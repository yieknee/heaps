

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
 return list if list.empty? || list.length == 1

 heap = MinHeap.new

 list.each do |num|
   heap.add(num)
 end
  list = [] 
 until heap.empty?
    removed = heap.remove
    list << removed
 end
 return list
end

