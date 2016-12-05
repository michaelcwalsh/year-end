require "rails_helper"

feature "User sees following feed" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:album) { FactoryGirl.create(:album, user: user2) }

  before do
    user_sign_in(user1)
    user_follows_user(user1, user2)
  end

  scenario "sees functioning feed on home page" do
    visit root_path

    expect(page).to have_content(album.title)
    expect(page).to have_content(album.artist)
    expect(page).to have_content(album.rating)
    expect(page).to have_content(user2.username)
  end
end
