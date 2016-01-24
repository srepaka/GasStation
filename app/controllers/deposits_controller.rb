class DepositsController < ApplicationController
	def create
		@daily_report = DailyReport.find(params[:daily_report_id])
		@deposit = @daily_report.transactions.create(deposit_params)
		redirect_to daily_report_deposits_path(@daily_report)
	end

	def index
		@entry_category = EntryCategory.find_by(category: 'Daily Deposit')
		@daily_report = DailyReport.find(params[:daily_report_id])
	end

	def edit
		@daily_report = DailyReport.find(params[:daily_report_id])
		@deposit = @daily_report.transactions.find(params[:id])
	end

	def update
		@daily_report = DailyReport.find(params[:daily_report_id])
		@deposit = @daily_report.transactions.find(params[:id])

		if @deposit.update(deposit_params)
			redirect_to daily_report_deposits_path(@daily_report)
		else
			render 'edit'
		end
	end

	def destroy
		@daily_report = DailyReport.find(params[:daily_report_id])
		@deposit = @daily_report.transactions.find(params[:id])
		@deposit.destroy
		redirect_to daily_report_deposits_path(@daily_report)
	end
	
	private
		def deposit_params
			params.require(:deposit).permit(:accounting_date, :transaction_date, :description, :entry_type_id, :entry_category_id, :amount)
		end
end
