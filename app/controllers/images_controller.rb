class ImagesController < Backoffice::BackofficeController
  before_action :set_product

  def create
    add_more_images(images_params[:images])
    flash[:error] = 'Failed uploading images' unless @product.save
    redirect_to :back
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = 'Failed deleting image' unless @product.save
    redirect_to edit_admin_product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:admin_product_id])
  end

  def add_more_images(new_images)
    images = @product.images # copy the old images
    images += new_images # concat old images with new ones
    @product.images = images # assign back
  end

  def remove_image_at_index(index)
    remain_images = @product.images # copy the array
    deleted_image = remain_images.delete_at(index) # delete the target image
    deleted_image.try(:remove!) # delete image from S3
    @product.images = remain_images # re-assign back
  end

  def images_params
    params.require(:product).permit(images: []) # allow nested params as array
  end
end
