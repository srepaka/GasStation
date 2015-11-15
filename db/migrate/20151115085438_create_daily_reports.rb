class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.date :date, null: false
      t.decimal :grocery, precision: 7, scale: 2, null: false
      t.decimal :fuel, precision: 7, scale: 2, null: false
      t.decimal :gift_cards, precision: 7, scale: 2, null: false, default: 0

      t.timestamps null: false
    end
  end
end
