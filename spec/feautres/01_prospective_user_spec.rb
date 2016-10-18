require "rails_helper"

feature "Prospective user" do
  let!(:user1) { FactoryGirl.build(:user) }
  let!(:user2) { FactoryGirl.build(:user) }

  scenario "sees link to sign up" do
    visit root_path
    expect(page).to have_link("Sign Up")
  end

  scenario "clicks link to sign up" do
    visit root_path
    click_link "Sign Up"

    scenario "sees fields to complete sign up" do
      expect(page).to have_content("Email (required)")
      expect(page).to have_content("Username (required)")
      expect(page).to have_content("Name (required)")
      expect(page).to have_content("Location (optional)")
      expect(page).to have_content("Bio (optional)")
      expect(page).to have_content("Password (required)")
      expect(page).to have_content("Confirm Password (required)")
    end

    scenario "correctly fills out form" do
      fill_in "Email (required)", with: user1.email
      fill_in "Username (required)", with: user1.username
      fill_in "Name (required)", with: user1.name
      fill_in "Password (required)", with: user1.password
      fill_in "Confirm Password (required)", with: user1.password
      click_button "Sign Up"

      scenario "is redirected to a home page after clicking submit" do
        expect(page).to have_current_path(root_path)
      end

      scenario "sees flash message informing them of successful sign up" do
        expect(page).to have_content("Sign up successful. Welcome to Year End.")
      end
    end

    scenario "leaves required fields blank" do
      click_button "Sign Up"

      scenario "receives error" do
        expect(page).to have_content("Email cannot be blank // Username cannot be blank // Name cannot be blank // Password cannot be blank")
      end
    end

    scenario "enters two seperate passwords" do
      fill_in "Email (required)", with: user1.email
      fill_in "Username (required)", with: user1.username
      fill_in "Name (required)", with: user1.name
      fill_in "Password (required)", with: user1.password
      fill_in "Confirm Password (required)", with: user2.password
      click_button "Sign Up"

      scenario "receives error" do
        expect(page).to have_content("Password and Confirm Password do not match")
      end
    end

    scenario "enters an incorrectly formatted password" do
      fill_in "Email (required)", with: user1.email
      fill_in "Username (required)", with: user1.username
      fill_in "Name (required)", with: user1.name
      fill_in "Password (required)", with: "12345"
      fill_in "Confirm Password (required)", with: "12345"
      click_button "Sign Up"

      scenario "receives error" do
        expect(page).to have_content("Password must be at least six characters")
      end
    end

    scenario "enters an email that already exists" do
      user1.create
      fill_in "Email (required)", with: user1.email
      fill_in "Username (required)", with: user2.username
      fill_in "Name (required)", with: user2.name
      fill_in "Password (required)", with: user2.password
      fill_in "Confirm Password (required)", with: user2.password
      click_button "Sign Up"

      scenario "receives error" do
        expect(page).to have_content("Email already taken. Try again.")
      end
    end

    scenario "enters an username that already exists" do
      user1.create
      fill_in "Email (required)", with: user2.email
      fill_in "Username (required)", with: user1.username
      fill_in "Name (required)", with: user2.name
      fill_in "Password (required)", with: user2.password
      fill_in "Confirm Password (required)", with: user2.password
      click_button "Sign Up"

      scenario "receives error" do
        expect(page).to have_content("Username already taken. Try again.")
      end
    end
  end
end
