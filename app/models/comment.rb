class Comment < ApplicationRecord
  include Voting
  belongs_to :post
  belongs_to :user
  has_many :votes, as: :voteable

  validates :body, presence: true
end
