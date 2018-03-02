class SongsController < ApplicationController
  def index
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      if @artist
       @songs = @artist.songs
      else
        @songs = Song.all
        flash[:alert] = "Artist not found."
        redirect_to artists_path
      end
    else

    end
  end

  def show
    #find_by Song.id into @song
      @song = Song.find_by(id: params[:id])
    #if artist_id
      if params[:artist_id]
    #find_by artist_id into @artist
        @artist = Artist.find_by(id: params[:artist_id])
    #if @song is include in the @artist.songs
        if @artist.songs.include?(@song)
    #displays the @song
          @song
        else
    #display all artists in @artists with flash alert
          @artists = Artist.all
          flash[:alert] = "Song not found."
    #redirect to artist_songs_path GET   /artists/:artist_id/songs/:id(.:format) songs#show
          redirect_to artist_songs_path
        end
      else
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
