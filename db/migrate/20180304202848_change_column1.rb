class ChangeColumn1 < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :isadmin
  end
end
