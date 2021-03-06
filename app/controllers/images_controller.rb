class ImagesController < ApplicationController

  def index 
    @images=Image.all    
  end

  def new 
    @image=Image.new()
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Successfully added new photo!"
      redirect_to root_path
    else
      flash.now[:alert] = "Error adding new photo!"
      render "new"
    end
  end

  private

  def image_params
    params.require(:image).permit(:assignment_image) if params[:image]
  end
  
end
