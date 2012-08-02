require File.expand_path("../../../lib/math/math_evaluate", __FILE__)

describe "math evalute" do  
  
  it "the params are equals the should be true" do
    MathEvaluate::Expression.eql?('2', '4/2').should be_true
  end
  
  it "the params are equals the should be true" do
    MathEvaluate::Expression.eql?('6.2', '12.4/2').should be_true
  end
  
  it "the params are equals the should be true" do
    MathEvaluate::Expression.eql?('3*3', '18/2').should be_true
  end
  
  it "the params are equals the should be true" do
    MathEvaluate::Expression.eql?('2', '2').should be_true
  end

  it "the params are equals the should be true" do
    MathEvaluate::Expression.eql?('6.2', '6.1 + 0.1').should be_true
  end
  
   it "the params are not equals the should be false" do
    MathEvaluate::Expression.eql?('1000', '100 + 0.0').should be_false
  end
end