class SongsController < ApplicationController
  def index
    if params[:artist_id]
      begin
        @songs = Artist.find(params[:artist_id]).songs
      rescue ActiveRecord::RecordNotFound
        # redirects when artist not found
        redirect_to artists_path, alert: "Artist not found"
      end
    else
      # returns 200 when just index with no artist_id
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id]
      begin
        # returns 200 with valid artist song
        @song = Song.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        # redirects to artists songs when artist song not found
        redirect_to artist_songs_path, alert: "Song not found"
      end
    else
      # returns 200 with valid song and no artist
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
