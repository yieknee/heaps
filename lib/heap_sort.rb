
def heapsort(array)
  my_heap = MinHeap.new

  array.each do |element|
    my_heap.add(element, element)
  end

  result = []
  until my_heap.empty?
    result << my_heap.remove
  end

  return result
end