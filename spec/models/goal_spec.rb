require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe "Create New Goal" do
    it "requires a target" do
      goal = Goal.new(user_id: 1, is_public: true, is_completed: false)
      expect(goal.save).to be_falsey
    end

    it "belongs to a user" do
      user =User.new(username: "me", password: "password")
      goal = user.goals.new(target: "lose 10 pounds", is_completed: true, is_public: true)
      expect(goal.user).to eq(user)
    end
  end
end
