class UserComment < ActiveRecord::Base

  validates :user_id, :author_id, :comment, presence: true

  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id,
    inverse_of: :authored_user_comments

  belongs_to :user,
    inverse_of: :recieved_user_comments

end
