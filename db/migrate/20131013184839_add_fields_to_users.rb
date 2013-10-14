class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, after: :email
    add_column :users, :last_name, :string, after: :first_name
    add_column :users, :dob, :string, after: :last_name
    add_column :users, :cell_phone, :string, after: :dob
  end
end
