class User
  include Mongoid::Document
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
  has_and_belongs_to_many :shops
  
  def points_in(shop)
    points ? points[shop.id.to_s] : nil
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
end

