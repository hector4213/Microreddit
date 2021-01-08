module PostsHelper
 #self is like this in js, wew

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
