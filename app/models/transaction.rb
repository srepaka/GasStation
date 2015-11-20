class Transaction < ActiveRecord::Base
  belongs_to :entry_category
  belongs_to :entry_type
  
  validates :accounting_date, :transaction_date, :description, :amount, presence: true
  validates :description, presence: true, length: { minimum: 3 }
end
