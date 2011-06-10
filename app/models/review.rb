class Review
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id, :type => String
  field :submission_id, :type => String
  field :review, :type => String
  validates_presence_of :review,:submission_id,:user_id
  belongs_to :user
  belongs_to :submission
end
