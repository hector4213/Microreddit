class Post < ApplicationRecord
    has_many :comments
    belongs_to :user
    validates :title, presence: true, length: { minimum: 4 }
    validates :url, presence: true, length: { minimum: 6 }
end
