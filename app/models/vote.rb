class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  #https://stackoverflow.com/questions/923796/how-do-you-validate-uniqueness-of-a-pair-of-ids-in-ruby-on-rails
  #ensures both user_id and post_id is unique so user can only vote once.
  validates_uniqueness_of :user_id, scope: [:voteable_id, :voteable_type]
end
