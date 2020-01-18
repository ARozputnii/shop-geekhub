class CommentsController < ApplicationController
  before_action :set_product
  before_action :set_comment, only: :destroy

  def index
    @product.comments = @product.comments.order(created_at: :desc)
  end

  def new
    @comment = Comment.new(comment_params)
  end

  def create
    @comment = @product.comments.create(comment_params)
    if @comment.save
      redirect_to @product
    else
      redirect_to @product, alert: @comment.errors.full_messages.first
    end
  end

  def destroy
    @comment.destroy
    redirect_to @product
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_comment
    @comment = @product.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body, :rating, :product_id)
  end
end