require 'rspec'

require_relative '../constants.rb'

describe SymbolicCalculator::ARITHMETIC_TABLE do
  it "does addition" do
    left  = Random.new.rand(100)
    right = Random.new.rand(100)
    total = left + right
    expect(SymbolicCalculator::ARITHMETIC_TABLE["+"].call(left, right)).to eq(total)
    expect(SymbolicCalculator::ARITHMETIC_TABLE["+"].call(2, 2)).to eq(4)
  end

  it "does subtraction" do
    left  = Random.new.rand(100)
    right = Random.new.rand(100)
    total = left - right
    expect(SymbolicCalculator::ARITHMETIC_TABLE["-"].call(left, right)).to eq(total)
    expect(SymbolicCalculator::ARITHMETIC_TABLE["-"].call(2, 2)).to eq(0)
  end

  it "does multiplication" do
    left  = Random.new.rand(100)
    right = Random.new.rand(100)
    total = left * right
    expect(SymbolicCalculator::ARITHMETIC_TABLE["*"].call(left, right)).to eq(total)
    expect(SymbolicCalculator::ARITHMETIC_TABLE["*"].call(2, 2)).to eq(4)
  end

  it "does division" do
    left  = Random.new.rand(100)
    right = Random.new.rand(100)
    total = left / right
    expect(SymbolicCalculator::ARITHMETIC_TABLE["/"].call(left, right)).to eq(total)
    expect(SymbolicCalculator::ARITHMETIC_TABLE["/"].call(4, 2)).to eq(2)
  end
end