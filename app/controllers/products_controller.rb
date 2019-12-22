class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
    @categories = Category.all.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end
end
