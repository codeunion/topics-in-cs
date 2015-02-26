require_relative '../stack'

describe Stack do
  before(:each){ @stack_a = Stack.new() }
  before(:each){ @stack_b = Stack.new() }
  before(:each){ @stack_c = Stack.new().push("a").push("b").push("c") }

  it "#push" do
    @stack_a.push("a")
    expect(@stack_a.pop).to eq("a")
    @stack_b.push("a").push("b")
    expect(@stack_b == Stack.new().push("a").push("b")).to eq(true)
  end

  it "#pop" do
    expect(@stack_a.pop.instance_of?(Stack::UnderflowError)).to eq(true)
    expect(@stack_c.pop).to eq("c")
  end

  it "#peek" do
    expect(@stack_c.peek).to eq("c")
    expect(@stack_a.peek).to eq(nil) # TODO: Should this be the expected behavior?
  end

  it "#empty" do
    expect(@stack_a.empty?).to eq(true)
    expect(@stack_b.empty?).to eq(true)
    expect(@stack_c.empty?).to eq(false)
  end

end
