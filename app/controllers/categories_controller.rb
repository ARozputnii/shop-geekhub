class CategoriesController < ApplicationController

  def index
    @categories = if params[:search]
                    Category.search(params[:search]).order(created_at: :desc).paginate(page: params[:page], per_page: 8)
                  else
                    Category.all.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
                  end
  end

  def show
    @category = Category.find(params[:id])
  end
end
