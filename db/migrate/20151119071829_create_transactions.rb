class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :accounting_date, null: false
      t.date :transaction_date, null: false
      t.string :description, length: { minimum: 5 }, null: false
      t.references :entry_type, index: true, foreign_key: true, null: false
      t.references :entry_category, index: true, foreign_key: true, null: false
      t.references :daily_report, index: true, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.boolean :flagged, null: false, default: false

      t.timestamps null: false
    end
  end
end
