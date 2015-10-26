require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  it 'has a new user page' do
    visit("/users/new")
    expect(page).to have_content("Create a new user account")
  end
  feature "signing up a user" do

    it "shows username on the homepage after signup" do

      signup("Andrew")

      expect(page).to have_content("Andrew")
    end

  end
end

feature "logging in" do
   it "shows username on the homepage after login" do
     signup("Andrew")
     logout
     visit "/session/new"
     fill_in("Username", with: "Andrew")
     fill_in("Password", with: "password")
     click_on("Submit")

     expect(page).to have_content("Andrew")
   end

end

feature "logging out" do
  it "begins with logged out state" do
    visit "/users"
    expect(page).to have_link("Login")
  end
  it "doesn't show username on the homepage after logout" do
    signup("Andrew")
    logout
    expect(page).not_to have_content("Andrew")
  end
end

# def signup
#   visit "/users/new"
#   fill_in("Username", with: "Andrew")
#   fill_in("Password", with: "password")
#   click_on("Create User")
# end
