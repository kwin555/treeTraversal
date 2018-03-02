class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
  def empty?
    @queue.size == 0
  end
end


# queue = MyQueue.new

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue
# queue.enqueue(3)
# queue.enqueue(4)
# queue.enqueue(5)
# puts queue.dequeue
# queue.enqueue(6)
# puts queue.dequeue
# puts queue.dequeue
# puts queue.dequeue
# puts queue.dequeue
