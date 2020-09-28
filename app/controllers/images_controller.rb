class ImagesController < ApplicationController
  def new
  	@image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      flash[:notice] = 'Image created'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
  	@image = Image.find(params[:id])
  	@image.destroy

  	flash[:notice] = "Image deleted"

  	redirect_to images_path
  end

  def index
  	@images = Image.all
  	@categories = Category.all
  end

  # def update
  #   @image = Image.find(params[:id])

  #   if @image.update(image_params)
  #     flash[:notice] = 'Category updated'
  #     redirect_to root_path
  #   end
  # end

  # def update
		# if @@image.update_attributes(image_params)
		# 	redirect_to root_path
		# else
		# 	render :edit
		# end

		# @category = Category.find(params[:id])
  #   @categories = Category.all
    # @images = @category.images

	# end


  private

  def image_params
    params.require(:image).permit(:image, :category_id, :image_title, :image_description, :image_file_size, :image_content_type, :remote_image_url)
  end
end
