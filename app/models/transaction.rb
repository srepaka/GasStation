class Transaction < ActiveRecord::Base
  belongs_to :entry_category
  belongs_to :entry_type
  belongs_to :daily_report
  
  validates :accounting_date, :transaction_date, :description, :amount, presence: true
  validates :description, presence: true, length: { minimum: 3 }

  def self.FilterDebit()
	@debit_entry_type = EntryType.find_by entry_type: 'Debit'
	where("\"transactions\".entry_type_id = ?", @debit_entry_type)
  end

  def self.FilterCredit()
	@debit_entry_type = EntryType.find_by entry_type: 'Credit'
	where("\"transactions\".entry_type_id = ?", @debit_entry_type)
  end

  def self.FilterByTDate(from_date, to_date)
	where("transaction_date >= ? AND transaction_date <= ?", from_date, to_date)
  end

  def self.FilterByADate(from_date, to_date)
	where("accounting_date >= ? AND accounting_date <= ?", from_date, to_date)
  end

  def self.FilterByDescription(description)
	if description
		where(["description LIKE ?", "%#{description}%"])
	else
		all
	end
  end
end
