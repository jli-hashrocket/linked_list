require 'pry'
class LinkedList
  def initialize
    @head = nil
  end

  def each
    node = @head
    while !node.nil?
      yield(node.data)
      node = node.next
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def [](index)
  # Code for accessing an individual element...
    node = @head
    if index == 0
      index = node
    elsif index == 1
      index = node.next
    else
      while node.data != index
        node = node.next
        if node.data == index
          index = node.next
          break;
        end
      end
    end
    index
  end

  def insert(index, value)
  # Code for inserting a node...
    index.next = Node.new(value, index.next) if index
  end

  def delete_at(index)
  # Code for removing a node...
  node = @head
    if index == 0
      @head = node.next
    else
      while (node != nil) && (node.next != nil) && (node.next != index.data)
        node = node.next
      end

      if node != nil && node.next != nil
        node.next = node.next
      end
    end
  end

  class Node
    attr_accessor :data, :next

    def initialize(data, next_node)
      self.data = data
      self.next = next_node
    end
  end
end

list = LinkedList.new
list.prepend(4)
list.prepend(3)
list.prepend(2)
list.prepend(1)
list.each{ |val| puts val }
# list.[](2) { |val| puts val.data}
index = list.[](2)
list.insert(index,6)
list.delete_at(index)
