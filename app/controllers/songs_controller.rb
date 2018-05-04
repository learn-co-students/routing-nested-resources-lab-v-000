class SongsController < ApplicationController
  def index
    unless params[:artist_id]
      @songs = Song.all
    else
      @songs = Artist.find(params[:artist_id]).songs
      end
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Artist not found."
      redirect_to(controller: :artists, action: :index)

  end

  def show
    @song = Song.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Song not found."
      redirect_to(controller: :songs, action: :index)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
