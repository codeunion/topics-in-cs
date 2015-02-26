require_relative '../binary_search_tree'

describe BinarySearchTree do

  context "#include?(value)" do
    let(:empty_tree){ BinarySearchTree.new() }
    let(:tree){ BinarySearchTree.new().insert(3).insert(2).insert(1) }

    it "returns false when the value the tree is empty" do
      expect(empty_tree.include?(rand(100))).to eq(false)
      expect(empty_tree.include?(rand(100))).to eq(false)
    end

    it "returns true when the value is == to a value held by one of the nodes in the tree" do
      expect(tree.include?(1)).to eq(true)
      expect(tree.include?(2)).to eq(true)
      expect(tree.include?(3)).to eq(true)
    end

    it "returns false when the value is != to any of the values held by the nodes in the tree" do
      expect(tree.include?(4)).to eq(false)
      expect(tree.include?(5)).to eq(false)
      expect(tree.include?(6)).to eq(false)
    end

    it "raises an error if the value argument does not match the type of values in the tree"
  end

  context "#insert(value)" do
    let(:tree){ BinarySearchTree.new().insert(1) }
    it "inserts the value into the tree" do
      expect(tree.size).to eq(1)
      tree.insert(2)
      expect(tree.size).to eq(2)
      expect(tree.include?(2)).to eq(true)
    end

    it "inserts the value into the tree in the correct location"
  end

  context "#remove(value)" do
    it "removes the value from the tree"
    it "removes all copies of the value from the tree -- can the tree hold duplicates??"
  end

  context "#empty?" do
    let(:empty){ BinarySearchTree.new() }
    let(:tree) { BinarySearchTree.new().insert(1)}
    it "returns true when there are no nodes in the tree, i.e. the root is Empty" do
      expect(empty.empty?).to eq(true)
    end

    it "returns false when there are one or more nodes in the tree" do
      expect(tree.empty?).to eq(false)
    end

  end
end