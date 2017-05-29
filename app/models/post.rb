class Post < ActiveRecord::Base
  # if post gets deleted, comments get deleted as well
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }
end
