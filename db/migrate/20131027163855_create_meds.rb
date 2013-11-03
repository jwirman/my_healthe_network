class CreateMeds < ActiveRecord::Migration
  def change
    create_table :meds do |t|
      t.string :generic_name
      t.string :brand_name
      t.string :strength

      t.timestamps
    end
  end
end
