class AddVoteableToVotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :votes, :voteable, polymorphic: true, null: false
  end
end
