class Backoffice::CategoriesController < Backoffice::BackofficeController
  before_action :find_category, only: %i[show edit update destroy]

  def index
    @products = Product.all.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
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
      redirect_to admin_products_path
      flash[:notice] = t('controllers.categories.created')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin_products_path
      flash[:notice] = t('controllers.categories.edited')
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_products_path, notice: t('controllers.categories.destroyed')
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
