class DailyReport < ActiveRecord::Base
	validates :date, :grocery, :fuel, :gift_cards, :credit, :debit, :cash, :commission, :actual_debit, :cash_counted, :commission, :actual_debit, :cash_counted, presence: true
	validates :date, uniqueness: true	
end
