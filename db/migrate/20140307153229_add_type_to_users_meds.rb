class AddTypeToUsersMeds < ActiveRecord::Migration
  def change
    add_column :users_meds, :type, :string, after: :med_id
  end
end
