class Goal < ActiveRecord::Base
  validates :target, :user, presence: true

  belongs_to :user

  has_many :comments,
    class_name: "GoalComment",
    foreign_key: :goal_id,
    inverse_of: :goal

end
