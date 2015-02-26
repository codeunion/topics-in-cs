require_relative '../../linked_list/base'

describe LinkedList::Base do
  before(:each){ @empty_list = LinkedList::Base.new() }
  before(:each){ @list = LinkedList::Base.new().unshift(1).unshift(2) }

  it "#empty?" do
    expect(@list.empty?).to eq(false)
    expect(@empty_list.empty?).to eq(true)
  end

  it "#length" do
    expect(@empty_list.length).to eq(0)
    expect(@list.length).to eq(2)
  end

  it "#tail" do
    expect(@list.tail.value).to eq(1)
    expect(@list.tail.class).to eq(LinkedList::Node)
    expect(@empty_list.head).to eq(@empty_list.tail)
    expect(@empty_list.head.class).to eq(LinkedList::Empty)
  end

  it "#peek" do
    expect(@list.peek).to eq(2)
  end

  it "#shift" do
    expect(@list.shift).to eq(2)
    expect(@list.peek).to eq(1)
  end

  it "#unshift" do
    @empty_list.unshift(10)
    expect(@empty_list.peek).to eq(10)
    expect(@empty_list.length).to eq(1)

    list_a = LinkedList::Base.new().unshift(LinkedList::Node.new("a"))
    expect(list_a.peek).to eq("a")
  end

  it "#prepend" do
    @empty_list.prepend(10)
    expect(@empty_list.peek).to eq(10)
    expect(@empty_list.length).to eq(1)

    @empty_list.prepend(20)
    expect(@empty_list.peek).to eq(10)
    expect(@empty_list.length).to eq(2)
  end

  it "#insert" do
    expect(@list.insert(3, 0).peek).to eq(3)
    expect(@list.insert(0, -1).tail.value).to eq(0)
    expect(@list.insert("a", 1)).to eq(LinkedList:Base.new().unshift(0).unshift(1).unshift(2).unshift("a").unshift(3))
  end

  it "#each" do
    results = []
    @list.each{ |e| results << e }
    expect(results).to eq([2, 1])
  end

  it "#map" do
    results = @list.map { |e| e * 2 }
    expect(results[0]).to eq(4)
  end

  it "#reduce" do
    results = @list.reduce([]){ |memo, e| memo << (e * 2) }
    expect(results[0]).to eq(4)
  end

  it "#==" do
    expect(@list == LinkedList::Base.new().unshift(1).unshift(2)).to eq(true)
    expect(@list == LinkedList::Base.new().unshift(1)).to eq(false)
    expect(@list == [2,1]).to eq(false)
  end

end
