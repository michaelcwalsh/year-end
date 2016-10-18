require "rails_helper"

feature "Prospective user" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario "sees link to sign in" do
    visit root_path
    expect(page).to have_link("Sign In")
  end

  before "clicks link to sign in" do
    visit root_path
    click_link "Sign In"
  end

  scenario "sees fields to complete sign in" do
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  context "correctly fills out form" do
    before do
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Log in"
    end

    scenario "is redirected to a home page after clicking submit" do
      expect(page).to have_current_path(root_path)
      expect(page).to have_content("Logged in as #{user1.username}")
    end

    scenario "sees flash message informing them of successful sign in" do
      expect(page).to have_content("Sign in successful. Welcome to Year End.")
    end
  end

  context "incorrectly fills out form" do
    scenario "receives error" do
      click_button "Sign in"
      expect(page).to have_content("Invalid Email or password")
    end
  end
end
