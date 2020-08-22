class SongsController < ApplicationController
  
  # def index
  #   # binding.pry
  #   if params[:artist_id]
  #     @artist = Artist.find_by(id: params[:artist_id])
  #     if @artist.nil?
  #       redirect_to artists_path, alert: "Artist not found"
  #     else
  #       @songs = @artist.songs
  #     end
  #   else
  #     @songs = Song.all
  #   end
  # end

  def index
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      if @artist
        @songs = @artist.songs
   	  else 
        flash[:notice] = "Artist not found."
		redirect_to artists_path
      end
    else  
      @songs = Song.all
    end
  end
 
  def show 
    # binding.pry
    if params[:artist_id]
      @song = Song.find_by(id: params[:artist_id])
      if @song
        @artist = @song.artist
      else
      flash[:alert] = "Artist song not found."
      redirect_to artist_songs_path(@artist_id)
      end
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

