require 'spec_helper'

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
            searched = Tree.new(1)
            tree = Tree.new(10, [Tree.new(4), searched])
            expect(tree.depth_first_search(tree, 1)).to eq searched
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
end
