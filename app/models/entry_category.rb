class EntryCategory < ActiveRecord::Base
  belongs_to :entry_type
end
