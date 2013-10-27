class CreateUsersMeds < ActiveRecord::Migration
  def change
    create_table :users_meds do |t|
      t.references :users
      t.references :meds
      t.string :freq
      t.integer :num_per_dose
      t.datetime :start
      t.integer :num_doses

      t.timestamps
    end
  end
end
