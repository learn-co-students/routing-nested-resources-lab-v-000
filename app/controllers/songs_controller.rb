class SongsController < ApplicationController
  def index
    #binding.pry
    
    if params[:artist_id]
      @artist = Artist.find_by_name(params[:artist_id]) || Artist.find_by_id(params[:artist_id])
      if @artist
        @songs = @artist.songs
        # redirect_to artist_songs_path(@artist.songs)
      else
        flash[:alert] = "Artist not found."
        redirect_to artists_path
      end
    else
      @songs = Song.all
    end
  end

  def show
    # @song = Song.find_by(params[:id])
    # if params[:artist_id]
    #   @artist = Artist.find_by(params[:artist_id])
    #   #binding.pry
    #   if @song
    #     redirect_to artist_song_path(@artist, @song)
    #   else
    #     
    #     redirect_to artist_songs_path(@artist.songs)
    #   end
    # else
    #   @song
    # end
    if params[:artist_id]
      @artist = Artist.find_by(params[:artist_id])
      @song = Song.find_by_id(params[:id])
      #binding.pry
      if @song
        @song
      else
        flash[:alert] = "Song not found."
        redirect_to artist_songs_path(@artist)
      #binding.pry
      end
    else
      @song = Song.find_by_id(params[:id])
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

