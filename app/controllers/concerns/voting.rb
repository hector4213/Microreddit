module Voting
  extend ActiveSupport::Concern
  #concerns are for DRYing code, used in controllers as methods, helpers are for views.
  #self is like this in js, wew
 
  #now both votes and comments have votables relationships (polymorphic)
  included do
    has_many :votes, as: :voteable
  end

  def vote_points
   up_votes - down_votes
  end
 
  def up_votes
   self.votes.where(vote: true).size
 end
 
 def down_votes
   self.votes.where(vote: false).size
 end
 
 
 end
 