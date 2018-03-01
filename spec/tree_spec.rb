require 'spec_helper'
require 'queue'
require 'tree'

RSpec.describe Tree, type: :model do
  describe '::initialize' do
    context 'when no arguments are provided' do
      it 'returns an error' do
        expect { Tree.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#payload' do
    it 'returns the payload provided in the initializer' do
      expect(described_class.new(5).payload).to eq 5
    end
  end

  describe '#children' do
    it 'returns an empty array if no agrument for children is given' do
      expect(described_class.new(5).children). to eq []
    end
  end

  describe '#children arguments' do
    it 'returns the children argument if a argument is passed' do
      children = [Tree.new(4), Tree.new(3)]
      expect(described_class.new(5, children).children).to eq children
    end
  end

  describe '.depth_first_search' do
    context 'when the searched number is in the tree' do
      context 'when the turnk node has the searched payload' do
        it 'returns the trunk' do
          trunk = Tree.new(10, [Tree.new(5), Tree.new(4)])
          expect(trunk.depth_first_search(trunk, 10)).to eq trunk
        end
      end
      context 'when the node being searched for is a child' do
        context 'when the node being searched for is on the left side' do
          it 'returns the node' do
            searched = Tree.new(1)
            tree = Tree.new(10, [searched, Tree.new(4)])
            expect(tree.depth_first_search(tree, 1)).to eq searched
          end
        end
        context ' when the node being searched for is on the right side' do
          it 'returns the node' do
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
            expect(trunk.depth_first_search(trunk, 4)).to eq fourth_node
          end
        end
      end
    end
    context 'when the searched number is Not in the tree' do
      it 'returns nil' do
        tree = Tree.new(4)
        expect(tree.depth_first_search(tree, 5)).to be nil
      end
    end
  end
  describe '#breadth_first_search' do
    context 'when given the searched number exists in the tree' do
      context 'when the searched number is in the trunk' do
        it 'returns the trunk' do
          trunk = Tree.new(5)
          expect(trunk.breadth_first_search(trunk, 5)).to eq trunk
        end
      end
      context 'when the search value is a child' do
        context 'when the search value is on the shallow left side' do
          it 'returns the node' do
            searched_value = Tree.new(23)
            tree = Tree.new(4, [searched_value, Tree.new(5)])
            expect(tree.breadth_first_search(tree, 23)).to eq searched_value
          end
        end
        context 'when the search value is on the shallow right side' do
          it 'returns the node' do
            searched_value = Tree.new(23)
            tree = Tree.new(4, [Tree.new(5), searched_value])
            expect(tree.breadth_first_search(tree, 23)).to eq searched_value
          end
        end
        context 'when the search value is deep left' do
          it 'should return the node' do
            searched_value = Tree.new(11)
            left_tree = Tree.new(7, [Tree.new(6, [Tree.new(5), searched_value])])
            right_tree = Tree.new(5, [Tree.new(9, [Tree.new(4)])])
            tree = Tree.new(2, [left_tree, right_tree])
            expect(tree.breadth_first_search(tree, 11)).to eq searched_value
          end
        end
        context 'when the search value is deep right' do
          it 'should return the node' do
            searched_value = Tree.new(9)
            left_tree = Tree.new(7, [Tree.new(6, [Tree.new(5), Tree.new(11)])])
            right_tree = Tree.new(5, [searched_value, [Tree.new(4)]])
            tree = Tree.new(2, [left_tree, right_tree])
            expect(tree.breadth_first_search(tree, 9)).to eq searched_value
          end
        end
      end
    end
    context ' when the value being searched for is not in the tree' do
      it 'shoud return nil' do
        tree = Tree.new(32453)
        expect(tree.breadth_first_search(tree, 5)). to be nil
      end
    end
  end
end
