class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: %i[show edit update destroy]

  def index
    @line_items = LineItem.all
  end

  def show; end

  def new
    @line_item = LineItem.new
  end

  def edit; end

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    if @line_item.save
      redirect_to @line_item.cart
    else
      render action: 'new'
    end
  end

  def update
    if @line_item.update(line_item_params)
    else
      render :edit
    end
  end

  def destroy
    @line_item.destroy
    redirect_to line_items_url, notice: 'Line item was successfully destroyed.'
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_id)
  end
end
