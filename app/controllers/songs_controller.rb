class SongsController < ApplicationController
  def index
    if params[:artist_id] #user puts in artists/1/songs
      @artist = Artist.find_by(id: params[:artist_id])
      if @artist
        @songs = @artist.songs
      else
        flash[:notice] = "The artist could not be found."
        redirect_to artists_path
      end
    else
      @songs = Song.all
    end
  end

  def show
    # binding.pry
    if params[:artist_id] #the artist_id is included in the url
      @artist = Artist.find_by(id: params[:artist_id])
      if @artist #the artist_id actually exists in db
        if @artist.song_ids.include?(params[:id].to_i) #the song belongs to the artist
          @song = Song.find_by(id: params[:id])
        else #the song does not belong to the artist
          flash[:alert] = "The song could not be found under the artist."
          redirect_to artist_songs_path(@artist)
        end
      else #the artist id was not found in the db.
        flash[:alert] = "The artist was not found."
        redirect_to songs_path
      end
    else #the artist_id is not included in the url. just straight /songs/2
      @song = Song.find_by(id: params[:id])
      if @song == nil
        flash[:alert] = "The song could not be found in the library."
        redirect_to songs_path
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
