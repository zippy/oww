module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the sign up page/
      '/users/sign_up'
    when /the sign in page/
      '/users/sign_in'

    when /the dashboard page/
      '/dashboard'

    when /the submissions page/
      '/submissions'
    when /the new submissions page/
      '/submission/new'
    when /the submission page for "([^\"]*)"/
      s = Submission.first(conditions: { title: $1 })
      "/submissions/#{s.id}"
    when /the edit submission page for "([^\"]*)"/
      s = Submission.first(conditions: { title: $1 })
      "/submissions/#{s.id}/edit"
    when /the new review page for "([^\"]*)"/
      s = Submission.first(conditions: { title: $1 })
      "/submissions/#{s.id}/reviews/new"
    when /the reviews page for "([^\"]*)"/
      s = Submission.first(conditions: { title: $1 })
      "/submissions/#{s.id}/reviews"
    when /the reviewer history page for "([^\"]*)"/
       u = User.first(conditions: { name: $1 })
       "/users/#{u.id}/reviewer_history"

    when /the shops page/
      '/shops'
    when /the new shops page/
      '/submission/new'
    when /the shop page for "([^\"]*)"/
      s = Shop.first(conditions: { name: $1 })
      "/shops/#{s.id}"
    when /the insufficient points page for "([^\"]*)"/
      s = Shop.first(conditions: { name: $1 })
      "/shops/#{s.id}/no_points"
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
