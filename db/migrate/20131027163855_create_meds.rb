class CreateMeds < ActiveRecord::Migration
  def change
    create_table :meds do |t|
      t.string :name
      t.string :strength

      t.timestamps
    end
  end
end
