Then /^(.*) should be taken to (.*)$/ do |actor,page|
  if !(current_url =~/http:\/\/[^\/]*(.*)/)
    raise "#{current_url} appears to not be a valid url"
  end
  path_plus_query = $1
  p = path_to(page)
  path_plus_query.should == p
end