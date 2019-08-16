class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :top

  # rename data value to top
  def initialize
    @top = nil
  end

  # Push a value onto the stack
  def push(value)
    @top = LinkedListNode.new(value, @top)
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
    if @top == nil
      return nil
    else
      value = @top.value
      @top = @top.next_node
      return value
    end
  end

  def peek
    return @top.next_node.value
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
  reverse_list = Stack.new

  while list != nil  
    reverse_list.push(list.value)
    list = list.next_node
  end
  return reverse_list
end

stack = Stack.new
stack.push(1)
stack.push(23)
stack.push(44)
stack.push(3)
stack.push(33)

print_values(stack.top)
reverse_stack = reverse_list(stack.top)
print_values(reverse_stack.top)
