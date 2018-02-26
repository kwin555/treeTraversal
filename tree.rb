class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7,[sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])

def depth_first_search(node, search_value)
  # Make TDD for this
  if node.nil?
    puts "node is nil"
    return nil
  end
  puts "I am #{node.payload}"
  if node.payload == search_value
    puts "found #{search_value}"
    return search_value
  end

  if node.children.nil? || node.children.empty?
    puts "no children"
    return nil
  end
  puts "My children are #{node.children.map(&:payload).join(' ')}"

  node.children.each do |child|
     result = depth_first_search(child, search_value)
     if !result.nil?
       return result
     end
  end

  return nil
end

#puts depth_first_search(trunk, 2) == 2

#puts depth_first_search(trunk, 11) == 11

depth_first_search(trunk, 9) == 9
