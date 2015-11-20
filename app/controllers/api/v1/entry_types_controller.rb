module Api
	module V1	
		class EntryTypesController < ApplicationController
			def show 
				@entry_type = EntryType.find(params[:id])
				@entry_categories = @entry_type.entry_categories.all
				render :json => @entry_categories.to_json()
			end
		end
	end
end
