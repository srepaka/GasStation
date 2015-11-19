class CreatePayouts < ActiveRecord::Migration
  def change
    create_table :payouts do |t|
      t.text :description, length: { minimum: 3 }, null: false
      t.decimal :amount, precision: 5, scale: 2, null: false
      t.references :daily_report, index: true, foreign_key: true, null: false
      t.integer :category, null: false

      t.timestamps null: false
    end
  end
end
