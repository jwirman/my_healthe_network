class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.references :user, index: true
      t.references :med, index: true
      t.datetime :taken_at

      t.timestamps
    end
  end
end
