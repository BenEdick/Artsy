class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end


  def show
    @artist = Artist.find(params[:id])
    @art = @artist.art
  end

  def new
    @artist = Artist.new
    @artist.build_art
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
        flash[:notice] = "Artist Added"

        redirect_to artists_url
      else
        render 'new'
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    if @artist.update(artist_params)
        flash[:notice] = "Arist has been updated"

        redirect_to artists_url
      else
        render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])

    @artist.destroy

    redirect_to artists_url
  end

  private
  def artist_params
    params.require(:artist).permit(:first_name, :last_name, :bio, :location, :dob, :p_image, art_attributes: [:name, :description, :type, :genre, :location])
  end

end

