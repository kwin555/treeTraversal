require 'queue'
# create a tree
class Tree
  attr_accessor :payload, :children
  def initialize(payload, children = [])
    @payload = payload
    @children = children
  end

  def depth_first_search(node, search_value)
    return node if payload == search_value
    children.each do |child|
      tree = child.depth_first_search(child, search_value)
      return tree unless tree.nil?
    end
    nil
  end

  def breadth_first_search(node, search_value)
    return node if node.payload == search_value
    queue = MyQueue.new
    queue.enqueue(node)
    until queue.empty?
      current_node = queue.dequeue
      return current_node if current_node.payload == search_value
      current_node.children.each do |child|
        queue.enqueue(child)
      end
    end
  end
end