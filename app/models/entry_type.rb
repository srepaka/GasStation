class EntryType < ActiveRecord::Base
	has_many :entry_categories, dependent: :destroy	
end
