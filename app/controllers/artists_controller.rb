class ArtistsController < ApplicationController
  def index
    binding.pry
    if params[:invalid_artist]
      @invalid_artist = true
    else
    @artists = Artist.all
  end
  end

  def show
    if Artist.find(params[:id])
      @artist = Artist.find(params[:id])
    else
      @no_artist = true
    end
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.update(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:notice] = "Artist deleted."
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
