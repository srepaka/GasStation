class Payout < ActiveRecord::Base
  belongs_to :daily_report
  belongs_to :payout_category
  validates :description, presence: true, length: { minimum: 3 }
end
