class GoalComment < ActiveRecord::Base
  validates :goal_id, :author_id, :comment, presence: true

  belongs_to :goal

  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id,
    inverse_of: :comments


end
