class TransactionsController < ApplicationController

	def index

		start_date = 1.week.ago
		@credit_entry_type = EntryType.find_by entry_type: 'Credit'
		@debit_entry_type = EntryType.find_by entry_type: 'Debit'
		
		@credit_transactions = Transaction.where("entry_type_id = ? AND transaction_date >= ?", @credit_entry_type, start_date).order('transaction_date ASC')
		@debit_transactions = Transaction.where("entry_type_id = ? AND transaction_date >= ?", @debit_entry_type, start_date).order('transaction_date ASC') 
		
		@old_credit_transactions = Transaction.where("entry_type_id = ? AND transaction_date < ?", @credit_entry_type, start_date)
		@old_debit_transactions = Transaction.where("entry_type_id = ? AND transaction_date < ?", @debit_entry_type, start_date)
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
