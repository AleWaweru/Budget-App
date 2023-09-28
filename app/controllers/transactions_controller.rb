class TransactionsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc)
    @total_amount = @transactions.sum(:amount)
  end

  def show
    @transaction = Transaction.find(params[:id])
    @category = @transaction.category
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.build
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.build(transaction_params)

    if @transaction.save
      redirect_to category_transactions_path(@category), notice: 'Transaction created successfully.'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.find(params[:id])
    @transaction.destroy
    redirect_to category_transactions_path(@category), notice: 'Transaction deleted successfully.'
  end

  private

  def transaction_params
    params.require(:transaction).permit(:description, :amount)
  end
end
