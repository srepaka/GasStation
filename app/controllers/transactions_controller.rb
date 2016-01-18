class TransactionsController < ApplicationController

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

		@credit_transactions = Transaction.FilterCredit().FilterByTDate(from_date, to_date).order('transaction_date ASC')
		@debit_transactions = Transaction.FilterDebit().FilterByTDate(from_date, to_date).order('transaction_date ASC') 
		
		@old_credit_transactions = Transaction.FilterCredit().where("transaction_date < ?", from_date)
		@old_debit_transactions = Transaction.FilterDebit().where("transaction_date < ?", from_date)
	end

	def new
		@transaction = Transaction.new
	end

	def edit
		@transaction = Transaction.find(params[:id])
	end

	def create
		@transaction = Transaction.new(transaction_params)
		
		if @transaction.save
			redirect_to transactions_path
		else
			render 'new'
		end
	end

	def update
		@transaction = Transaction.find(params[:id])
		
		if @transaction.update(transaction_params)
			redirect_to transactions_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@transaction = Transaction.find(params[:id])
		@transaction.destroy

		redirect_to transactions_path
	end

	private
		def transaction_params
			params.require(:transaction).permit(:accounting_date, :transaction_date, :description, :entry_type_id, :entry_category_id, :amount)
		end	
end
