class CreatePayoutCategories < ActiveRecord::Migration
  def change
    create_table :payout_categories do |t|
      t.string :pcategory, null: false, uniqueness: true

      t.timestamps null: false
    end
  end
end
