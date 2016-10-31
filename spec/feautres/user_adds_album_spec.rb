require "rails_helper"

feature "User adds album" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:album1) { FactoryGirl.create(:album) }

  before do
    user_sign_in(user1)
  end

  scenario "successfully adds album to list" do
    visit new_album_path
    fill_in "Artist (required)", with: album1.artist
    fill_in "Album Title (required)", with: album1.title
    fill_in "Rating (required) (0-10; decimals encouraged)", with: album1.rating
    click_button "Add to list"

    expect(page).to have_content(user1.name)
    expect(page).to have_content(album1.title)
    expect(page).to have_content(album1.artist)
  end

  scenario "unsuccessfully adds album to list" do
    visit new_album_path
    click_button "Add to list"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Artist can't be blank")
    expect(page).to have_content("Rating can't be blank")
  end
end
