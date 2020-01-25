class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy]

  def index
    @carts = Cart.all
  end

  def show
    if @cart.line_items.empty?
      redirect_to products_url, notice: t('cart.empty')
    end
  end

  def new
    @cart = Cart.new
  end

  def edit; end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart, notice: 'Cart was successfully created.'
    else
      render :new
    end
  end

  def update
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to products_url, notice: 'Теперь ваша корзина пуста!'
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.fetch(:cart, {})
  end
end
