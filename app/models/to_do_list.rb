class ToDoList < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  validates :user_id, presence: true

  # Make a description just like a micropost
  validates :description, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }

end
