class Goal < ActiveRecord::Base
  validates :target, :user, presence: true

  belongs_to :user

  has_many :comments,
    as: :commentable
end
