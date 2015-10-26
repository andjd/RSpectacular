require 'spec_helper'
require 'rails_helper'

feature "it has goal comments" do
  before(:each) do
    signup("Andrew")
    create_public_goal
    logout
    signup("Dan")
    visit user_url(User.first)
    click_on "Add Comment"
  end


  scenario "it lets you comment on a goal" do

    expect(page).to have_content("Add Comment")
  end

  it "lets you wrtie a comment" do
    fill_in :comment, with: "Best. Goal. Never."
    click_button "New Comment"
    expect(page).to have_content "Best. Goal. Never."
  end
end
