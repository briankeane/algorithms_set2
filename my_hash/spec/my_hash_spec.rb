require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../my_hash.rb'

describe "MyHash" do
  before(:each) do
    @hash = MyHash.new
  end
  describe "#find_index" do
    it "should return an index that is between 0 and 64 and it stays the same" do
      expect(@hash.find_index("hello") >= 0).to eq(true)
      expect(@hash.find_index("hello") < 64).to eq(true)
      expect(@hash.find_index("hello")).to eq(@hash.find_index("hello"))
      expect(@hash.find_index("bye") >= 0).to eq(true)
      expect(@hash.find_index("bye") < 64).to eq(true)
      expect(@hash.find_index("bye")).to eq(@hash.find_index("bye"))
    end
  end

  describe "#[] and []=" do
    it "should not find an element that you didn't put in" do
      expect(@hash["hello"]).to eq (nil)
      expect(@hash["bye"]).to eq (nil)
    end

    it "should find elements that you did put in" do
      @hash["hello"] = "hey"
      @hash["bye"] = "good bye"
      expect(@hash["hello"]).to eq("hey")
      expect(@hash["bye"]).to eq("good bye")
    end
  end


end
