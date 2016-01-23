class TransactionsController < ApplicationController

	def index
		@from_date_is_null = true
		@to_date_is_null = true
		@description_is_null = true
		@category_is_null = true
		
		if (params[:from_date] && params[:from_date] != "")
			@from_date_is_null = false
			from_date = params[:from_date]
		else
			from_date = 2.weeks.ago
		end

		if (params[:to_date] && params[:to_date] != "")
			@to_date_is_null = false
			to_date = params[:to_date]
		else
			to_date = Date.today
		end

		if (params[:description] && params[:description] != "*")
			@description_is_null = false
			description = params[:description]
		else
			description = nil
		end

		if (params[:category] && params[:category] != "*")
			@category_is_null = false
			category = params[:category]
		else
			category = nil
		end

		@credit_transactions_filtered = Transaction.FilterCredit().FilterByDescription(description).FilterByCategory(category)
		@debit_transactions_filtered = Transaction.FilterDebit().FilterByDescription(description).FilterByCategory(category)

		@credit_transactions = @credit_transactions_filtered.FilterByTDate(from_date, to_date).order('transaction_date ASC')
		@debit_transactions = @debit_transactions_filtered.FilterByTDate(from_date, to_date).order('transaction_date ASC') 
		
		@old_credit_transactions = @credit_transactions_filtered.where("transaction_date < ?", from_date)
		@old_debit_transactions = @debit_transactions_filtered.where("transaction_date < ?", from_date)
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

	def report
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

		@credit_transactions = Transaction.FilterCredit.FilterByADate(from_date, to_date)
		@debit_transactions = Transaction.FilterDebit.FilterByADate(from_date, to_date)

		@credit_transaction_groups = @credit_transactions.joins(:entry_category).select("category, amount").group(:category).order('category ASC').sum(:amount)
		@debit_transaction_groups = @debit_transactions.joins(:entry_category).select("category, amount").group(:category).order('category ASC').sum(:amount)

		@sum_credits = @credit_transactions.sum(:amount)
		@sum_debits = @debit_transactions.sum(:amount)
	end

	def toggle_flagged
		@transaction = Transaction.find(params[:id])
		@transaction.toggle!(:flagged)

		respond_to do |format|
			format.js {render inline: "location.reload();" }
		end
	end

	private
		def transaction_params
			params.require(:transaction).permit(:accounting_date, :transaction_date, :description, :entry_type_id, :entry_category_id, :amount)
		end	
end
