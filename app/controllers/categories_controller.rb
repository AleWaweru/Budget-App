class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    # Calculate total amount for each category
    @categories.each do |category|
      category.total_amount = category.transactions.sum(:amount)
    end
  end

  def show
    @category = Category.find(params[:id])
    @transactions = @category.transactions
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category created successfully.'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end

  def transactions
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions

    # Calculate total amount
    @total_amount = @transactions.sum(:amount)
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
