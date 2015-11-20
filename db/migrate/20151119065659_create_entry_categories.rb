class CreateEntryCategories < ActiveRecord::Migration
  def change
    create_table :entry_categories do |t|
      t.string :category, null: false, :unique => true
      t.references :entry_type, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
