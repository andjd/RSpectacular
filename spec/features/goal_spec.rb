require 'spec_helper'
require 'rails_helper'

feature "create goal" do
  scenario "it lets you create a new goal" do
    create_private_goal
    expect(page).to have_content("Goal created")
  end

  scenario "it lets you set a goal as private" do
    create_private_goal
    logout
    signup("Dan")
    visit user_url(User.first)
    expect(page).to_not have_content("Lose 10 lbs")

  end
end

feature "displays goals" do
  scenario "it lets you see all your goals" do
    create_private_goal
    create_public_goal
    expect(page).to have_content("Lose 10 lbs")
    expect(page).to have_content("CRUSH IT")

  end

  scenario "it lets you see other peoples' public goals" do
    create_private_goal
    create_public_goal
    logout
    signup("Dan")
    visit user_url(User.first)
    expect(page).to have_content("CRUSH IT")
  end

  scenario "it does not let you see other peoples' private goals" do
    create_private_goal
    create_public_goal
    logout
    signup("Dan")
    visit user_url(User.first)
    expect(page).to_not have_content("Lose 10 lbs")
  end
end

feature "it lets you edit goals" do
  scenario "it lets you mark a goal as completed" do
    mark_goal_as_checked
    expect(page).to have_content("1 Goal Completed")
  end
  scenario "it does not let your edit others' goals" do
    create_private_goal
    create_public_goal
    logout
    signup("dan")
    visit user_url(User.first)
    expect(page).to_not have_button("Edit Goal")
  end
end
