require 'spec_helper'

describe Review do
  before(:each) do
    @sub = Factory(:submission)
    @user = @sub.user
    @attr = { 
      :review => "This is the text of the review",
      :user_id => @user.id,
      :submission_id => @sub.id,
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Review.create!(@attr)
  end
  it "should require a review" do
    s = Review.new(@attr.merge(:review => ""))
    s.should_not be_valid
  end
  it "should require a submission" do
    s = Review.new(@attr.merge(:user_id => ""))
    s.should_not be_valid
  end
  it "should require a user" do
    s = Review.new(@attr.merge(:submission_id => ""))
    s.should_not be_valid
  end
  describe "relations" do
    before(:each) do
      @review = Review.create!(@attr)
    end
    it "should have one submissions" do
      @review.submission.should == @sub
    end
    it "should have one users" do
      @review.user.should == @user
    end
  end
end
