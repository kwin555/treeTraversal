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

  def breath_first_search(node, search_value)
    return node if payload == search_value
    queue = MyQueue.new
    children.each do |child|
      return child if child.payload == search_value
      queue.enqueue(child)
    end
    current_node = queue.dequeue
    return current_node.breath_first_search(node, search_value) \
    unless current_node.nil?
  end
end
#
# tree = Tree.new(5)
# puts tree.depth_first_search(tree, 5).inspect
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])
# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])

puts trunk.depth_first_search(trunk, 11).inspect
