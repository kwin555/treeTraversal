class Tree
  attr_accessor :payload, :children
  def initialize(payload, children = [])
    @payload = payload
    @children = children
  end

  def depth_first_search(search_value)
    return self if payload == search_value
    children.each do |child|
      tree = child.depth_first_search(search_value)
      return tree unless tree.nil?
    end
    nil
  end
end
