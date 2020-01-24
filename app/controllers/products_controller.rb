class ProductsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @product  = Product.first
    @products = if params[:search]
                  Product.search(params[:search]).paginate(page: params[:page], per_page: 8)
                elsif params[:sort] == 'asc'
                  Product.all.asc.paginate(page: params[:page], per_page: 8)
                elsif params[:sort] == 'desc'
                  Product.all.desc.paginate(page: params[:page], per_page: 8)
                elsif params[:sort] == 'new_products'
                  Product.all.new_products.paginate(page: params[:page], per_page: 8)
                elsif params[:sort] == 'old_products'
                  Product.all.old_products.paginate(page: params[:page], per_page: 8)
                elsif params[:sort] == 'best_star'
                  Product.joins(:comments).best_star.paginate(page: params[:page], per_page: 8)
                else
                  Product.all.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
                end
    @categories = Category.all
    if params[:category]
      @category = Category.find_by(id: params[:category])
      @products = @category.products.paginate(page: params[:page], per_page: 20)
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
