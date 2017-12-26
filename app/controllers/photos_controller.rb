class PhotosController < ApplicationController
  before_action :authorize

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end
  
  def create
    photo = Photo.new(photo_params)
    photo.user_id = session[:user_id]

    if photo.save
      redirect_to :photos
    else
      redirect_to "/"
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  private

    def photo_params
      params.require(:photo).permit(:image_name, :image)
    end
end
