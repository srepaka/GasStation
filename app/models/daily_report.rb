class DailyReport < ActiveRecord::Base
	has_many :payouts, dependent: :destroy
	has_many :transactions, dependent: :destroy
	validates :date, :grocery, :fuel, :gift_cards, :credit, :debit, :cash, :commission, :actual_debit, :cash_counted, :commission, :actual_debit, :cash_counted, presence: true
	validates :date, uniqueness: true	
	
	def self.FilterByDate(from_date, to_date)
		where("date >= ? AND date <= ?", from_date, to_date)
	end
end
