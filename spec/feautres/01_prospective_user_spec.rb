require "rails_helper"

feature "Prospective user" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario "sees link to sign up" do
    visit "/"
    expect(page).to have_link("Sign Up")
  end

  # scenario "clicks link to sign up" do
  #   scenario "sees fields to complete"
  # end
end
