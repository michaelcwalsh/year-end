require "rails_helper"

feature "User follows user" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:album) { FactoryGirl.create(:album, user: user2) }

  before do
    user_sign_in(user1)
  end

  scenario "sees follow button on other user page" do
    visit user_path(user2.id)

    expect(page).to have_button("Follow")
  end

  scenario "follows other user" do
    visit user_path(user2.id)
    click_button("Follow")

    expect(page).to have_current_path(user_path(user2.id))
    expect(page).to have_content("You are now following #{user2.username}")
    expect(page).to have_button("Unfollow")
  end

  context "follows other user" do
    before do
      visit user_path(user2.id)
      click_button("Follow")
      visit root_path
    end

    scenario "sees followed user's data on home page" do
      expect(page).to have_content(album.title)
      expect(page).to have_content(album.artist)
    end
  end
end
