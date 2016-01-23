class PayoutCategory < ActiveRecord::Base
	validates :pcategory, presence: true, uniqueness: true
end
