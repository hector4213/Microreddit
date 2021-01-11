class Comment < ApplicationRecord
  include Voting
  belongs_to :post
  belongs_to :user

  validates :body, presence: true
end
