class SongsController < ApplicationController
  def index

    # deleted code
    # @songs = Song.all

    # https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-10-routes-and-resources/routing-and-nested-resources-lab
    # Update the songs_controller to allow the songs#index and songs#show
    # actions to handle a valid song for the artist.

    # new code start
    if params[:artist_id]
      if @artist = Artist.find_by(id: params[:artist_id])
        @songs = @artist.songs
      else
        flash[:not_found] = "Artist not found"
        redirect_to artists_path
      end
    else
      @songs = Song.all
    end
    # new code end


  end

  def show

    # deleted code
    # @song = Song.find(params[:id])


    # https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-10-routes-and-resources/routing-and-nested-resources-lab
    # Update the songs_controller to allow the songs#index and songs#show
    # actions to handle a valid song for the artist.

    # In the songs#show action, if the song can't be found for a given artist,
    # redirect to the index of the artist's songs and set a flash[:alert]
    # of "Song not found."

    #  # new code start
    #  if Song.exists?(id: params[:id])
    #    @song = Song.find(params[:id])
    #  else
    #    flash[:alert] = "Song not found."
    #    redirect_to artist_songs_path(params[:artist_id])
    #  end
    #  # new code end

    # refactored solution
    # new code start
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      @song = @artist.songs.find_by(id: params[:id])
      if @song.nil?
        redirect_to artist_songs_path(@artist), alert: "Song not found"
      end
    else
        @song = Song.find(params[:id])
    end
    # new code finish

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
