class Post < ApplicationRecord
  has_many :comments
  #a post can have many comments
  validates :title, presence: true,
                      length: {minimum: 5}
end
