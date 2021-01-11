class RemoveVotetypeFromVotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :votes, :vote_type, :string
  end
end
