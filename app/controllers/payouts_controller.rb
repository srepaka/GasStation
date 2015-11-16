class PayoutsController < ApplicationController
	def create
		@daily_report = DailyReport.find(params[:daily_report_id])
		@payout = @daily_report.payouts.create(payout_params)
		redirect_to daily_report_payouts_path(@daily_report)
	end

	def index
		@daily_report = DailyReport.find(params[:daily_report_id])
	end

	def edit
		@daily_report = DailyReport.find(params[:daily_report_id])
		@payout = @daily_report.payouts.find(params[:id])
	end

	def update
		@daily_report = DailyReport.find(params[:daily_report_id])
		@payout = @daily_report.payouts.find(params[:id])

	 	if @payout.update(payout_params)
			redirect_to daily_report_payouts_path(@daily_report)
		else
			render 'edit'
		end
	end

	def destroy
		@daily_report = DailyReport.find(params[:daily_report_id])
		@payout = @daily_report.payouts.find(params[:id])
		@payout.destroy
		redirect_to daily_report_payouts_path(@daily_report)		
	end


	private
		def payout_params
			params.require(:payout).permit(:description, :amount, :category)
		end
end
