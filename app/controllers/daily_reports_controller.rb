class DailyReportsController < ApplicationController
	def index
		@DailyReports = DailyReport.all
	end

	def new
		@daily_report = DailyReport.new
	end

	def edit
		@daily_report = DailyReport.find(params[:id])
	end

	def create
		@daily_report = DailyReport.new(daily_report_params)

		if @daily_report.save
			redirect_to daily_reports_path
		else
			render 'new'
		end
	end

	def update
		@daily_report = DailyReport.find(params[:id])
		
		if @daily_report.update(daily_report_params)
			redirect_to daily_reports_path
		else
			render 'edit'
		end
	end

	def destroy
		@daily_report = DailyReport.find(params[:id])
		@daily_report.destroy
		
		redirect_to daily_reports_path
	end

	private
		def daily_report_params
			params.require(:daily_report).permit(:date, :grocery, :fuel, :gift_cards, :credit, :debit, :cash, :commission, :actual_debit, :cash_counted, :notes)
		end	
end
