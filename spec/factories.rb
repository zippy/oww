require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'user@test.com'
    password 'please'
  end
  factory :shop do
    name 'OWW SFF'
    points_to_submit 4
  end
  factory :submission do
    title "My writing"
    genre "sf"
    kind "story"
    audience "adult"
    submission "This is the text of my submission"
    user
    shop
  end
end
