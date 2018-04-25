require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  
  let(:chef) { double("chef", :titleize => "Chef BOB the Great Baker") }


  subject(:dessert) do 
    Dessert.new("breakfast", 4, chef)
  end

  describe "#initialize" do
    it "sets a type" do 
      expect(dessert.type).to eq("breakfast")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(4)
    end 

    it "starts ingredients as an empty array" do 
      expect(dessert.ingredients).to eq([])
    end
    
    it "raises an argument error when given a non-integer quantity" do 
      expect{Dessert.new("breakfast", "a", chef)}.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    before(:each) do 
      dessert.add_ingredient("Rum")
    end

    it "adds an ingredient to the ingredients array" do 
      expect(dessert.ingredients.first).to eq("Rum")
    end
  end



  describe "#mix!" do
    before(:each) do 
      dessert.add_ingredient("CARROTS")
      dessert.add_ingredient("ORANGES")
      dessert.add_ingredient("CREAM")
      dessert.add_ingredient("FLOUR")
      dessert.mix!
    end
    it "shuffles the ingredient array" do 
      expect(dessert.ingredients == ["CARROTS","ORANGES","CREAM","FLOUR"]).to be(false)
    end
  end

  describe "#eat" do
    before(:each) do 
      dessert.eat(2)
    end
    it "subtracts an amount from the quantity" do 

    end

    it "raises an error if the amount is greater than the quantity" do 
      expect{dessert.eat(5)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      expect(dessert.serve).to include("Chef BOB the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake)
      dessert.make_more
    end
  end
end
