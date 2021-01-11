class Post < ApplicationRecord
  include Voting
  belongs_to :user
  has_many :comments
  validates :title, presence: true, length: { minimum: 4 }
  validates :url, presence: true, length: { minimum: 6 }
end
