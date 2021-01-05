class Post < ApplicationRecord
    validates :title, presence: true, length: { minimum: 4 }
    validates :url, presence: true, length: { minimum: 6 }
end
