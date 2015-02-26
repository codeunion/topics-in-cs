require_relative '../binary_tree_node'

describe BinaryTreeNode do
  let(:tree) { BinaryTreeNode.new(2, {left: BinaryTreeNode.new(1), right: BinaryTreeNode.new(3)}) }

  it "#value" do
    #TODO
    expect(tree.value).to eq(2)
  end

  it "#left" do
    #TODO
    expect(tree.left).to  eq(BinaryTreeNode.new(1))
  end

  it "#right" do
    #TODO
    expect(tree.right).to eq(BinaryTreeNode.new(3))
  end

  it "#children" do
    #TODO
  end

  it "#each" do
    #TODO
  end

  it "#pre_order" do
    #TODO
  end

  it "#in_order" do
    #TODO
  end

  it "#post_order" do
    #TODO
  end

  it "#==" do
    #TODO
  end

end
