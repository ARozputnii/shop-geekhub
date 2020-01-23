class OrdersController < ApplicationController
  include CurrentCart
  before_action :admin_verify, only: %i[show index edit update destroy]
  before_action :set_cart
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = Order.all
  end

  def show; end

  def new
    if @cart.line_items.empty?
      redirect_to products_url, notice: 'Your cart is empty'
      return
    end
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to products_url, notice:
          'Thank you for your order.'
    else
      render action: 'new'
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :address, :email, :phone)
  end
end
