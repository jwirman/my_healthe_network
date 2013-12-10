class CreateScans < ActiveRecord::Migration
  def change
    create_table :scans do |t|
      t.references :user, index: true
      t.references :med, index: true

      t.timestamps
    end
  end
end
