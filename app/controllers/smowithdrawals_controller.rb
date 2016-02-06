class SmowithdrawalsController < ApplicationController
	def create
		@daily_report = DailyReport.find(params[:daily_report_id])
		@smowithdrawal = @daily_report.transactions.create(smowithdrawal_params)
		redirect_to daily_report_smowithdrawals_path(@daily_report)
	end

	def index
		@entry_category = EntryCategory.find_by(category: 'SMO Withdrawal')
		@daily_report = DailyReport.find(params[:daily_report_id])
	end

	def destroy
		@daily_report = DailyReport.find(params[:daily_report_id])
		@smowithdrawal = @daily_report.transactions.find(params[:id])
		@smowithdrawal.destroy
		redirect_to daily_report_smowithdrawals_path(@daily_report)
	end

	private
		def smowithdrawal_params
			params.require(:smowithdrawal).permit(:accounting_date, :transaction_date, :description, :entry_type_id, :entry_category_id, :amount)
		end
end
