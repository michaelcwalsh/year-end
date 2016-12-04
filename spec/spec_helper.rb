RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def user_sign_in(user)
  visit root_path
  click_link("Sign In")
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Log in"
end

def user_follows_user(user1, user2)
  visit user_path(user2.id)
  click_button "Follow"
end
