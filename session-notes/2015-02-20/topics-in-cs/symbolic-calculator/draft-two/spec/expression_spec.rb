require 'rspec'

require_relative '../expression.rb'

describe SymbolicCalculator::Expression do
  context "#evaluate" do
    it "does addition" do
      left = SymbolicCalculator::Expression.new(Random.new.rand(100))
      right = SymbolicCalculator::Expression.new(Random.new.rand(100))
      total = left.value + right.value
      expect(SymbolicCalculator::Expression.new("+", left, right).evaluate.value).to eq(total)
    end

    it "does subtraction" do
      left  = SymbolicCalculator::Expression.new(Random.new.rand(100))
      right = SymbolicCalculator::Expression.new(Random.new.rand(100))
      total = left.value - right.value
      expect(SymbolicCalculator::Expression.new("-", left, right).evaluate.value).to eq(total)
    end

    it "handles identities" do
      left  = SymbolicCalculator::Expression.new("x")
      right = SymbolicCalculator::Expression.new(0)
      expect(SymbolicCalculator::Expression.new("+", left, right).evaluate.to_s).to eq(left.to_s)
    end

    it "does x x * => x 2 **" do
      left  = SymbolicCalculator::Expression.new("x")
      right = SymbolicCalculator::Expression.new("x")
      expect(SymbolicCalculator::Expression.new("*", left, right).evaluate.to_s).to eq("x 2 **")
    end

    it "does x x * x * => x 3 **" do
      left  = SymbolicCalculator::Expression.new("*", SymbolicCalculator::Expression.new("x"), SymbolicCalculator::Expression.new("x")).evaluate
      right = SymbolicCalculator::Expression.new("x")
      expect(SymbolicCalculator::Expression.new("*", left, right).evaluate.to_s).to eq("x 3 **")
    end

    it "does x x * x / => x" do
      left  = SymbolicCalculator::Expression.new("*", SymbolicCalculator::Expression.new("x"), SymbolicCalculator::Expression.new("x")).evaluate
      right = SymbolicCalculator::Expression.new("x")
      expect(SymbolicCalculator::Expression.new("/", left, right).evaluate.to_s).to eq("x")
    end

    it "does x 1 ** => x" do
      left  = SymbolicCalculator::Expression.new("x")
      right = SymbolicCalculator::Expression.new(1)
      expect(SymbolicCalculator::Expression.new("**", left, right).evaluate.to_s).to eq("x")
    end

    it "does x 0 ** => 1" do
      left  = SymbolicCalculator::Expression.new("x")
      right = SymbolicCalculator::Expression.new(0)
      expect(SymbolicCalculator::Expression.new("**", left, right).evaluate.to_s).to eq("1")
    end
  end

  context "#do_arithmetic" do
    it "does addition" do
      left = SymbolicCalculator::Expression.new(Random.new.rand(100))
      right = SymbolicCalculator::Expression.new(Random.new.rand(100))
      total = left.value + right.value
      expect(SymbolicCalculator::Expression.new("+", left, right).do_arithmetic.value).to eq(total)
    end
  end
end
