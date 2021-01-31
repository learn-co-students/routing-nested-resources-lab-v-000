class SongsController < ApplicationController


  def index
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      #find = if not valid id, error
      #find_by = fails silently, returns nil, continues to execute program
      if @artist
        @songs = @artist.songs
      else
        redirect_to artists_path, alert: "Artist not found"
      end
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id] #checks to see if artist_id was passed in
      @artist = Artist.find_by(id: params[:artist_id]) # if an artist was supplied, look for an artist by id in params
      @song = @artist.songs.find_by(id: params[:id]) # assign @song to equal the found artists songs by that artists id in params
      if @song.nil? #if that artist is nil - then @song is nil too
        redirect_to artist_songs_path(@artist), alert: "Song not found" #an error is set up notifying user that song not found
      end
    else
        @song = Song.find(params[:id]) #if the artist is valid - shows artists songs
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
