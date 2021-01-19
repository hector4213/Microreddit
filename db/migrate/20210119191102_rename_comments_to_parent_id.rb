class RenameCommentsToParentId < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :comment_id, :parent_id
  end
end
