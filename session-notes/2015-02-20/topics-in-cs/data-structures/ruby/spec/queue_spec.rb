require_relative '../queue'

describe Queue do

  before(:each){ @empty = Queue.new() }
  before(:each){ @queue_a = Queue.new().enqueue("a").enqueue("b").enqueue("c") }
  before(:each){ @queue_b = Queue.new().enqueue("c").enqueue("b").enqueue("a") }


  it "#enqueue" do
    #TODO
    expect(@empty.enqueue(1).peek).to eq(1)
  end

  it "#dequeue" do
    #TODOD
    expect(@queue_a.size).to eq(3)
    expect(@queue_a.dequeue).to eq("a")
    expect(@queue_a.size).to eq(2)
    expect(@queue_b.dequeue).to eq("c")
  end

  it "#peek" do
    expect(@queue_a.peek).to eq("a")
    expect(@queue_b.peek).to eq("c")
  end

  it "#empty?" do
    expect(@empty.empty?).to eq(true)
    expect(@queue_a.empty?).to eq(false)
    expect(@queue_b.empty?).to eq(false)
  end

  it "#size" do
    expect(@empty.size).to eq(0)
    expect(@queue_a.size).to eq(3)
    expect(@queue_b.size).to eq(3)
  end

end
