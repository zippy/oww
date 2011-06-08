require 'spec_helper'

describe Shop do
  before(:each) do
    @attr = { 
      :name => "OWW SFF",
      :points_to_submit => 4,
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Shop.create!(@attr)
  end
  it "should require a name" do
    s = Shop.new(@attr.merge(:name => ""))
    s.should_not be_valid
  end
  it "should require a points_to_submit" do
    s = Shop.new(@attr.merge(:points_to_submit => ""))
    s.should_not be_valid
  end
  describe "relations" do
    before(:each) do
      @shop = Shop.create!(@attr)
    end
    it "should have many submissions" do
      @sub = Factory(:submission)
      @shop.submissions << @sub
      @shop.submissions.should == [@sub]
    end
    it "should have many users" do
      @user = Factory(:user)
      @shop.users << @user
      @shop.users.should == [@user]
    end
  end
end
