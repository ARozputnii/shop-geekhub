class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = Product.all.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
  end
end
