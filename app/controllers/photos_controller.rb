class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end
  
  def create
    #TODO attach a User to a Photo
    byebug
    photo = Photo.new(photo_params)
    photo.user_id = session[:user_id]

    if photo.save
      redirect_to "/"
    else
      redirect_to "/"
    end
  end

  private

    def photo_params
      params.require(:photo).permit(:image_name, :image)
    end
end
