class AddUserAdminToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :isadmin, :float
  end
end
