# comments have things to explore or talk about?

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :top

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

  # allow user to set how many nodes deep to peek? yes lets try
  def peek(depth=1)
    peek = @top
    depth.times do
      peek = peek.next_node
    end
    return peek.value
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

# should this be in the stack class?
# should this create a new stack? Or in some situations you might not want to create two stacks
def reverse_stack(list)
  reverse_list = Stack.new

  while list 
    reverse_list.push(list.value)
    list = list.next_node
  end
  return reverse_list
end

def reverse_list(current_node, previous_node=nil)
  while current_node.next_node
    temporary_node = current_node.next_node
    current_node.next_node = previous_node
    previous_node = current_node.value
    current_node = temporary_node
  end
  return current_node.value
end


# talk to Cassey about this?
def check_for_infinite_loop(list)

  hare = list
  turtle = list

  while hare.next_node
    hare = hare.next_node.next_node
    # puts 'hare ' + hare.value.to_s
    turtle = turtle.next_node
    # puts 'turtle ' + turtle.value.to_s
    if hare == turtle
      return true
    end
  end
  return false
end

# stack = Stack.new
# stack.push(1)
# stack.push(23)
# stack.push(44)
# stack.push(3)
# stack.push(33)

# puts stack.peek(2)

# print_values(stack.top)
# reverse_stack = reverse_stack(stack.top)
# print_values(reverse_stack.top)

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3

node4 = LinkedListNode.new(37)
node5 = LinkedListNode.new(99, node4)
node6 = LinkedListNode.new(12, node5)


puts reverse_list(node6)

puts check_for_infinite_loop(node3)
puts check_for_infinite_loop(node6)
