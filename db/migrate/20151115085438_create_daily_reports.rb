class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.date :date, null: false

      t.decimal :grocery, precision: 7, scale: 2, null: false
      t.decimal :fuel, precision: 7, scale: 2, null: false
      t.decimal :gift_cards, precision: 7, scale: 2, null: false, default: 0

      t.decimal :credit, precision: 7, scale: 2, null: false
      t.decimal :debit, precision: 7, scale: 2, null: false
      t.decimal :cash, precision: 7, scale: 2, null: false

      t.decimal :commission, precision: 7, scale: 2, null: false, default: 225.00

      t.decimal :cash_counted, precision: 7, scale: 2, null: false

      t.text :notes

      t.timestamps null: false
    end
  end
end
