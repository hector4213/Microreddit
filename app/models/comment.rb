class Comment < ApplicationRecord
  include Voting
  belongs_to :post
  belongs_to :user
  has_many :votes, as: :voteable
  has_many :comment, :class_name => "Comment", :foreign_key => "parent_id"



  validates :body, presence: true
end
