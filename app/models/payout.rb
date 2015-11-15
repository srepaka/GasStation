class Payout < ActiveRecord::Base
  belongs_to :daily_report
  validates :description, presence: true, length: { minimum: 3 }
end
