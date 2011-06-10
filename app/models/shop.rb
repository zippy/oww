class Shop
  include Mongoid::Document
  field :name, :type => String
  field :points_to_submit, :type => Integer, :default => 0
  field :dimensions, :type => Array
  validates_presence_of :name
  validates_numericality_of :points_to_submit, :greater_than_or_equal_to => 0
  has_many :submissions
  has_and_belongs_to_many :users
end
