module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    # shared
    when /the home\s?page/
      '/'

    # articles
    when /the articles overview page/
      articles_path
    when /the articles index page/
      articles_path
    when /the search results page/
      search_path

    # categories
    when /the categories index/
      categories_path
    when /the categories overview page/
      categories_path
    when /^the edit page for category "(.*)"$/
      edit_category_path(Category.find_by_title($1))

    # pages
    when /the writers page/
      "/writers"
    
    # users
    when /the users page/
      "/users"
    when /the user registration page/
      new_user_registration_path
    when /the users overview page/
      users_path
    when /the user account page/
      edit_user_registration_path
    when /the user sign-in page/
      new_user_session_path
    when /the user confirmation page/
      new_confirmation_path
    when /^the show user page for "(.*)"$/
      user = User.where(:email => $1).first
      user_path(user)
    when /^the edit page for user "(.*)"$/
      user = User.where(:email => $1).first
      edit_user_path(user)

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
