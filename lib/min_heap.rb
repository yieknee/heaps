class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: 0(1)?
  # Space Complexity: o(n)?
  def add(key, value = key)
    node = HeapNode.new(key, value)
    if @store.empty?
      @store << node
    else
      @store << node
      current_index = @store.length - 1
      @store = heap_up(current_index)
    end

  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    removed = @store[0].value
    @store[0] = @store[@store.length - 1]
    parent_node = @store[0]
    @store.pop
    @store = heap_down(0)
    return removed
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    node = @store[index]
    parent_index = (index - 1)/2
    parent_node = @store[parent_index]
    return @store if parent_node.key <= node.key || index == 0

    @store[index] = parent_node
    @store[parent_index] = node
    
    index = parent_index
    return heap_up(index)
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    parent_node = @store[index]
    left_child_index = index * 2 + 1
    right_child_index = index * 2 + 2
    left_child = @store[left_child_index] 
    right_child = @store[right_child_index]
    if left_child.nil? == false && right_child.nil? == false
      return @store if (parent_node.key <= left_child.key && parent_node.key <= right_child.key)

      if left_child.key < right_child.key
        @store[index] = left_child
        @store[left_child_index] = parent_node
        index = left_child_index
        return heap_down(index)
      else
        @store[index] = right_child
        @store[right_child_index] = parent_node
        index = right_child_index
        return heap_down(index)
      end
    elsif left_child.nil? == true && right_child.nil? == true
      return @store 
    elsif left_child.nil? == true && right_child.nil? == false
      return @store if parent_node.key <= right_child.key 
      @store[index] = right_child
      @store[right_child_index] = parent_node
      index = right_child_index
      return heap_down(index)
    else left_child.nil? == false && right_child.nil? == true
      return @store if parent_node.key <= left_child.key
      @store[index] = left_child
      @store[left_child_index] = parent_node
      index = left_child_index
      return heap_down(index)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end