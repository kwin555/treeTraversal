# creating a tree
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
end
#
# tree = Tree.new(5)
# puts tree.depth_first_search(tree, 5).inspect
