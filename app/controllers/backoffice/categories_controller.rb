class Backoffice::CategoriesController < Backoffice::BackofficeController
  before_action :find_category, only: %i[show edit update destroy]

  def index
    @categories = if params[:search]
                    Category.search(params[:search]).order(created_at: :desc).paginate(page: params[:page], per_page: 8)
                  else
                    Category.all.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
                  end
  end

  def show
    @products = Product.all.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin: @category
      flash[:notice] = 'Category has been added'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin: @category
      flash[:notice] = 'Category has been edited'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: 'Category was successfully destroyed.'
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
