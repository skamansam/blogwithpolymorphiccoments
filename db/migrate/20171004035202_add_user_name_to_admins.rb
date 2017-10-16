class AddUserNameToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :user_name, :string
  end
end
