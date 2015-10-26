class Goal < ActiveRecord::Base
  validates :target, :user, presence: true

  belongs_to :user
end
