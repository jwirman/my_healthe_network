class CreateUsersMeds < ActiveRecord::Migration
  def change
    create_table :users_meds do |t|
      t.references :user
      t.references :med
      t.string :freq
      t.string :freq_unit
      t.integer :num_per_dose
      t.date :start
      t.time :first_dose
      t.time :second_dose
      t.time :third_dose
      t.time :fourth_dose
      t.time :fifth_dose
      t.time :sixth_dose
      t.integer :window, default: 5, null: false
      t.integer :num_doses

      t.timestamps
    end
  end
end
