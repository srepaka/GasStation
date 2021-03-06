class DailyReportsController < ApplicationController
	def index

		@from_date_is_null = true
		@to_date_is_null = true

		if (params[:from_date])
			@from_date_is_null = false
			from_date = params[:from_date]
		else
			from_date = 2.weeks.ago
		end
		
		if (params[:to_date])
			@to_date_is_null = false
			to_date = params[:to_date]
		else
			to_date = Date.today
		end

		@DailyReports = DailyReport.FilterByDate(from_date, to_date).order('date ASC')
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

	def payoutsreport
		@from_date_is_null = true
		@to_date_is_null = true

		if (params[:from_date])
			@from_date_is_null = false
			from_date = params[:from_date]
		else
			from_date = 1.month.ago
		end
		
		if (params[:to_date])
			@to_date_is_null = false
			to_date = params[:to_date]
		else
			to_date = Date.today
		end

		@payouts = DailyReport.FilterByDate(from_date, to_date).joins(:payouts => :payout_category).select(:amount, :pcategory) 
		@payout_groups = @payouts.group(:pcategory).sum(:amount)
		@payouts_sum = @payouts.sum(:amount)
	end

	private
		def daily_report_params
			params.require(:daily_report).permit(:date, :grocery, :fuel, :gift_cards, :credit, :debit, :cash, :commission, :cash_counted, :notes)
		end	
end
