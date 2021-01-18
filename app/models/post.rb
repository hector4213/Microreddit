class Post < ApplicationRecord
  include Voting
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, as: :voteable
  validates :title, presence: true, length: { minimum: 4 }
  validates :url, presence: true, length: { minimum: 6 }

  scope :recent, -> {where(created_at: :desc)}

end
