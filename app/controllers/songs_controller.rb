class SongsController < ApplicationController
  def index
    
    if params[:artist_id]
      if Artist.find_by_id(params[:artist_id]) == nil
        
        flash[:notice] = "Artist not found"
        redirect_to artists_path
      else
        #raise params.inspect        
        @songs = Artist.find(params[:artist_id]).songs    
      end
    else
      @songs = Song.all
    end
  end

  def show
      #raise params.inspect
      artist = Artist.find_by_id(params[:artist_id])
      
      if Song.find_by_id(params[:id]) == nil
        #raise params.inspect
        flash[:alert] = "Song not found"
        redirect_to artist_songs_path(artist)
      else
        @song = Song.find(params[:id])      
      end


  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    artist = Artist.find_by(:name => @song.artist.name)

    if artist ==nil || artist.name = ""
      
      redirect_to artist_path(artist)
    elsif @song.save
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

