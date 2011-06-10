require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = { 
      :name => "Example User",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end
  
  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end
    
    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
    
  end
  
  describe "password encryption" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end
  
  describe "submission relations" do
    before(:each) do
      @user = User.create!(@attr)
      @sub = Factory(:submission)
    end
    it "should be able to have many submissions" do
      @user.submissions << @sub
      @user.submissions.should == [@sub]
    end
    it "should be able to have many reviews" do
      @review = Review.create!(:review => 'Text of review',:submission_id => @sub.id, :user_id => @user.id)
      @user.reviews << @reviews
      @user.reviews.should == [@review]
    end
  end
  
  describe "shop relations" do
    
    before(:each) do
      @shop = Factory(:shop)
      @user = User.create!(@attr)
      @user.shops << @shop
    end
    it "should be able to belong to many shops" do
      @user.shops.should == [@shop]
    end
    it "should start with undefined points in a shop" do
      @user.points_in(@shop).should == nil
    end
    it "should get points for reviewing" do
      @user.adjust_points_for(@shop,:reviewing)
      @user.points_in(@shop).should == 4
    end
    it "should lose points for sumitting" do
      @user.adjust_points_for(@shop,:reviewing)
      @user.adjust_points_for(@shop,:submitting)
      @user.points_in(@shop).should == 0      
    end
    it "should persist points" do
      @user.adjust_points_for(@shop,:reviewing)
      User.first.points_in(@shop).should == 4
    end
  end

end