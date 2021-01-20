class Comment < ApplicationRecord
  include Voting
  belongs_to :post
  belongs_to :user
  has_many :votes, as: :voteable

  belongs_to :parent, class_name: "Comment", optional: true
  has_many :replies, class_name: "Comment", :foreign_key => "parent_id"

  validates :body, presence: true
end
