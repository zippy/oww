class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :name
  field :points, :type => Hash
#  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  has_many :submissions
  has_many :reviews
  has_and_belongs_to_many :shops

  def reviews_in(shop)
    reviews.find_all {|r| r.submission && r.submission.shop.id.to_s == shop.id.to_s}
  end
  
  def points_in(shop)
    points ? points[shop.id.to_s] : nil
  end

  def set_points_for(shop,points)
    self.points ||= {}
    shop_id = shop.id.to_s
    self.points[shop_id] = points
    save
  end

  def adjust_points_for(shop,direction)
    self.points ||= {}
    shop_id = shop.id.to_s
    self.points[shop_id] ||= 0
    if direction == :reviewing 
      self.points[shop_id] += shop.points_to_submit
    elsif direction == :submitting
      self.points[shop_id] -= shop.points_to_submit
    end
    self.save
  end
  
  def can_submit_in(shop)
    p = points_in(shop)
    p && p  >= shop.points_to_submit
  end
end

