require 'rspec'

require_relative '../symbolic_calculator.rb'

describe SymbolicCalculator::Calculator do
  context "#evaluate" do
    it "calculates" do 
      expect(SymbolicCalculator::Calculator.new("2 2 *").evaluate.to_s).to eq("4")
      expect(SymbolicCalculator::Calculator.new("2 3 +").evaluate.to_s).to eq("5")
      expect(SymbolicCalculator::Calculator.new("x x *").evaluate.to_s).to eq("x 2 **")
      expect(SymbolicCalculator::Calculator.new("x x * x *").evaluate.to_s).to eq("x 3 **")
      expect(SymbolicCalculator::Calculator.new("x x * x /").evaluate.to_s).to eq("x 1 **")
      expect(SymbolicCalculator::Calculator.new("x 0 *").evaluate.to_s).to eq("0")
      expect(SymbolicCalculator::Calculator.new("x 0 /").evaluate.to_s).to eq("Infinity")
      expect(SymbolicCalculator::Calculator.new("2 2 + x 0 / +").evaluate.to_s).to eq("Infinity")

    end
  end
end