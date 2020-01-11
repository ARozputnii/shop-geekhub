class ProductsController < ApplicationController
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
                elsif params[:sort] == 'book_id'
                  Product.all.book_id.paginate(page: params[:page], per_page: 8)
                elsif params[:sort] == 'magazine_id'
                  Product.all.magazine_id.paginate(page: params[:page], per_page: 8)
                elsif params[:sort] == 'manga_id'
                  Product.all.manga_id.paginate(page: params[:page], per_page: 8)
                else
                  Product.all.paginate(page: params[:page], per_page: 8)
                end
  end

  def show
    @product = Product.find(params[:id])
  end
end
