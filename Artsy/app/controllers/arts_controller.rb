class ArtsController < ApplicationController
  def index
    @art_works = Art.all
  end


  def show
    @art = Art.find(params[:id])
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)

    if @art.save
        flash[:notice] = "Art Added"

        redirect_to art_url
      else
        render 'new'
    end
  end

  def edit
    @art = Art.find(params[:id])
  end

  def update
    @art = Art.find(params[:id])

    if @art.update(art_params)
        flash[:notice] = "Art has been updated"

        redirect_to art_url
      else
        render 'edit'
    end
  end

  def destroy
    @art = Art.find(params[:id])

    @art.destroy

    redirect_to art_url
  end

  private
  def art_params
    params.require(:art).permit(:name, :description, :type, :genre, :location)
  end

end

