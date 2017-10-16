class AddUserToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :user, :string
  end
end
