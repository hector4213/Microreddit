class RemovePostIdFromVotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :votes, :post_id
  end
end
