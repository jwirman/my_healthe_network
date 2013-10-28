class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, default: false, null: false, after: :last_name
  end
end
