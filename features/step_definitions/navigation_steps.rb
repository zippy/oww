Then /^(.*) should be taken to (.*)$/ do |actor,page|
  if !(current_url =~/http:\/\/[^\/]*(.*)/)
    raise "#{current_url} appears to not be a valid url"
  end
  path_plus_query = $1
  p = path_to(page)
  path_plus_query.should == p
end

Then /^I should( not)* see "([^\"]*)" as the current menu item$/ do |should_not,menu_name|
  if should_not
    find('a.active').should have_no_content(menu_name)
  else
    find('a.active').should have_content(menu_name)
  end
end