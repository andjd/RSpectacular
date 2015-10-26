class Comment < ActiveRecord::Base

  validates :author, :commentable, :comment, presence: true
  validates :commentable_type, inclusion: {in: ["User", "Goal"]}

  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id

  belongs_to :commentable, polymorphic: true

end
