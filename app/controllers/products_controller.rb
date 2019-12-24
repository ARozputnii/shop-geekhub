class ProductsController < ApplicationController
  def index
    @product  = Product.first
    @products = if params[:search]
                  Product.search(params[:search]).paginate(page: params[:page], per_page: 8)
                else
                  Product.all.paginate(page: params[:page], per_page: 8)
                end
    @categories = Category.all.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end
end
