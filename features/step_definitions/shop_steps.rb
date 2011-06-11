Given /^a shop "([^"]*)" with (\d+) points to submit$/ do |name, points_to_submit|
  Shop.new(:name => name,
            :points_to_submit => points_to_submit).save!
end

Given /^that I have (\d+) points in "([^"]*)"$/ do |points, shop_name|
  current_user = User.first
  shop = Shop.first(conditions: { name: shop_name })
  current_user.set_points_for(shop,points.to_i)
end