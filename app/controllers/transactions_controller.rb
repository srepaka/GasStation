class TransactionsController < ApplicationController
	def index
		@credit_entry_type = EntryType.find_by entry_type: 'Credit'
		@debit_entry_type = EntryType.find_by entry_type: 'Debit'
		@credit_transactions = Transaction.where("entry_type_id = ?", @credit_entry_type)
		@debit_transactions = Transaction.where("entry_type_id = ?", @debit_entry_type)
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
