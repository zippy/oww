Given /^a shop "([^"]*)" with "([^"]*)" points to submit$/ do |name, points_to_submit|
  Shop.new(:name => name,
            :points_to_submit => points_to_submit).save!
end
