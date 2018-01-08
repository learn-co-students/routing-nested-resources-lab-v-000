class SongsController < ApplicationController

  def index
    if params[:artist_id]
      if artist = Artist.find_by(id: params[:artist_id])
        @songs = artist.songs
        redirect_to 'songs/index'
      else
        @artists = Artist.all # @songs = Song.all
        redirect_to artists_path
      end
    else
      @songs = Song.all
    end
    # else
    #   @artists = Artist.all # @songs = Song.all
    #   redirect_to 'artists/index'
    # end
  end

  def show
    if artist = Artist.find_by(id: params[:artist_id])
      if !Song.find_by(id: params[:id])
        flash[:alert] = "Song not found!"
        redirect_to artist_songs_path
      end

    # binding.pry
    # if artist = Artist.find_by(id: params[:artist_id])
    #   @song = Song.find_by(id: params[:id])
    #   redirect_to 'songs/show'
    else
      @song = Song.find_by(id: params[:id])
    end

    # @song = Song.find(params[:id])
  end


  # def new
  #   @song = Song.new
  # end
  #
  # def create
  #   @song = Song.new(song_params)
  #
  #   if @song.save
  #     redirect_to @song
  #   else
  #     render :new
  #   end
  # end
  #
  # def edit
  #   @song = Song.find(params[:id])
  # end
  #
  # def update
  #   @song = Song.find(params[:id])
  #
  #   @song.update(song_params)
  #
  #   if @song.save
  #     redirect_to @song
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @song = Song.find(params[:id])
  #   @song.destroy
  #   flash[:notice] = "Song deleted."
  #   redirect_to songs_path
  # end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
