class Payout < ActiveRecord::Base
  belongs_to :daily_report
  validates :description, presence: true, length: { minimum: 3 }
  enum category: [:D, :J, :Inventory, :ATM, :Maintenance, :Calibration, :Other]
end
