class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to '/photos'
  end
  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to '/photos'
  end

  def photo_params
    params.require(:photo).permit(:name, :image)
  end
end
