class CreateEntryTypes < ActiveRecord::Migration
  def change
    create_table :entry_types do |t|
      t.string :entry_type, :unique => true

      t.timestamps null: false
    end
  end
end
