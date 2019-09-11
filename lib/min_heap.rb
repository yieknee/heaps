
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

  def add(key, value)
    node = HeapNode.new(key, value)
    @store.push(node)
    heap_up(@store.length - 1)
  end

  def remove()
    return nil if @store.empty?

    swap(0, @store.length - 1)
    remove_me = @store.pop

    heap_down(0)
    return remove_me.value
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

  def empty?
    return @store.empty?
  end

  private

  def heap_up(index)
    return if index == 0

    parent = (index - 1) / 2
    
    if @store[index].key < @store[parent].key
      swap(index, parent)
      heap_up(parent)
    end
  end

  def heap_down(index)
    left_index = index * 2 + 1
    right_index = index * 2 + 2

    if right_index < @store.length

      min_child = @store[left_index].key < @store[right_index].key ? left_index : right_index

      if @store[index].key > @store[min_child].key
        swap(index, min_child)
        heap_down(min_child)
      end
    elsif left_index < @store.length
      if @store[index].key > @store[left_index].key
        swap(index, left_index)
      end
    end
  end

  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end