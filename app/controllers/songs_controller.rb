class SongsController < ApplicationController
  def index
# binding.pry
    if params[:artist_id] 
      if Artist.exists?(params[:artist_id])
        @songs=Artist.find(params[:artist_id]).songs     
      else
        redirect_to artists_path 
        flash[:alert]="Artist not found"
      end
    else
      @songs = Song.all
    end
  end

  def show
  # binding.pry
    if params[:artist_id]
  # binding.pry 
      if Song.exists?(params[:id])
        @song=Artist.find(params[:artist_id]).songs.find(params[:id])
      else
        @artist=Artist.find(params[:artist_id])
        flash[:alert] = "Song not found."
        redirect_to artist_songs_path
      end

    else
  # binding.pry
      @song = Song.find(params[:id])
    end
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

