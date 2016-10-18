require "rails_helper"

feature "Prospective user" do
  let!(:user1) { FactoryGirl.build(:user) }
  let!(:user2) { FactoryGirl.build(:user) }

  scenario "sees link to sign up" do
    visit root_path
    expect(page).to have_link("Sign Up")
  end

  before "clicks link to sign up" do
    visit root_path
    click_link "Sign Up"
  end

  scenario "sees fields to complete sign up" do
    expect(page).to have_content("Email (required)")
    expect(page).to have_content("Username (required)")
    expect(page).to have_content("Name (required)")
    expect(page).to have_content("Location (optional)")
    expect(page).to have_content("Bio (optional)")
    expect(page).to have_content("Password (required)")
    expect(page).to have_content("Confirm Password (required)")
  end

  context "correctly fills out form" do
    before do
      fill_in "Email (required)", with: user1.email
      fill_in "Username (required)", with: user1.username
      fill_in "Name (required)", with: user1.name
      fill_in "Password (required)", with: user1.password
      fill_in "Confirm Password (required)", with: user1.password
      click_button "Sign up"
    end

    scenario "is redirected to a home page after clicking submit" do
      expect(page).to have_current_path(root_path)
    end

    scenario "sees flash message informing them of successful sign up" do
      expect(page).to have_content("Sign up successful. Welcome to Year End.")
    end
  end

  context "leaves required fields blank" do
    scenario "receives error" do
      click_button "Sign up"
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Username can't be blank")
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Password can't be blank")
    end
  end

  context "enters two seperate passwords" do
    scenario "receives error" do
      fill_in "Email (required)", with: user1.email
      fill_in "Username (required)", with: user1.username
      fill_in "Name (required)", with: user1.name
      fill_in "Password (required)", with: user1.password
      fill_in "Confirm Password (required)", with: "123456890"
      click_button "Sign up"

      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end

  context "enters an incorrectly formatted password" do
    scenario "receives error" do
      fill_in "Email (required)", with: user1.email
      fill_in "Username (required)", with: user1.username
      fill_in "Name (required)", with: user1.name
      fill_in "Password (required)", with: "12345"
      fill_in "Confirm Password (required)", with: "12345"
      click_button "Sign up"

      expect(page).to have_content("Password is too short (minimum is 6 characters)")
    end
  end

  context "enters an email that already exists" do
    scenario "receives error" do
      user3 = FactoryGirl.create(:user)
      fill_in "Email (required)", with: user3.email
      fill_in "Username (required)", with: user2.username
      fill_in "Name (required)", with: user2.name
      fill_in "Password (required)", with: user2.password
      fill_in "Confirm Password (required)", with: user2.password
      click_button "Sign up"

      expect(page).to have_content("Email has already been taken")
    end
  end

  context "enters an username that already exists" do
    scenario "receives error" do
      user3 = FactoryGirl.create(:user)
      fill_in "Email (required)", with: user2.email
      fill_in "Username (required)", with: user3.username
      fill_in "Name (required)", with: user2.name
      fill_in "Password (required)", with: user2.password
      fill_in "Confirm Password (required)", with: user2.password
      click_button "Sign up"

      expect(page).to have_content("Username has already been taken")
    end
  end
end
