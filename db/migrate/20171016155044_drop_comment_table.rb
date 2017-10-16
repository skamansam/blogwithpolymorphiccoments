class DropCommentTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :comments
  end

  def down 
  end
end
