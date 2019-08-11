class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  # Push a value onto the stack
  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
    if @data == nil
      return nil
    else
      value = @data.value
      @data = @data.next_node
      return value
    end
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list)
  while list.data != nil
    puts list.pop
  end
end

stack = Stack.new
stack.push(1)
stack.push(23)
stack.push(44)
stack.push(3)
stack.push(33)

reverse_list(stack)
