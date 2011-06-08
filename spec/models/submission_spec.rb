require 'spec_helper'

describe Submission do
  before(:each) do
    @user = Factory(:user)
    @shop = Factory(:shop)
    
    @attr = { 
      :title => "My writing",
      :user_id => @user.id,
      :genre => "sf",
      :kind => "story",
      :audience => "adult",
      :submission => "This is the text of my submission",
      :shop_id => @shop.id
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Submission.create!(@attr)
  end
  it "should require a user" do
    s = Submission.new(@attr.merge(:user_id => ""))
    s.should_not be_valid
  end
  it "should require a shop" do
    s = Submission.new(@attr.merge(:shop_id => ""))
    s.should_not be_valid
  end
  it "should require a title" do
    s = Submission.new(@attr.merge(:title => ""))
    s.should_not be_valid
  end
  it "should require a kind" do
    s = Submission.new(@attr.merge(:kind => ""))
    s.should_not be_valid
  end
  it "should require a genre" do
    s = Submission.new(@attr.merge(:genre => ""))
    s.should_not be_valid
  end
  it "should require an audience" do
    s = Submission.new(@attr.merge(:audience => ""))
    s.should_not be_valid
  end
  it "should require submission text" do
    s = Submission.new(@attr.merge(:submission => ""))
    s.should_not be_valid
  end
  describe "relations" do
    it "should belong to a person" do
      Submission.create!(@attr).user.should == @user
    end
    it "should belong to a shop" do
      Submission.create!(@attr).shop.should == @shop
    end    
  end
end
