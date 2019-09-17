class SongsController < ApplicationController
  def index
    if params[:artist_id]
      if Artist.pluck(:id).include?(params[:artist_id].to_i)
        @songs = Artist.find(params[:artist_id]).songs
      else
        flash[:alert] = "Artist not found"
        redirect_to artists_path
      end
    else
      @songs = Song.all
    end
  end

  def show
    if Song.pluck(:id).include?(params[:id].to_i) #=> song_valid
      if params[:author_id] #=> artist_provided
        if Artist.pluck(:id).include?(params[:author_id].to_i) #=> artist_valid
          if Artist.find(params[:artist_id]).songs.pluck(params[:id]).include?(params[:id].to_i) #=> artist.song
            @song = Song.find(params[:id])
          else
            flash[:alert] = "The requested song does not belong to this artist."
            redirect_to artist_songs_path(params[:artist_id])
          end
        else
          redirect_to artists_path
        end
      else
        @song = Song.find(params[:id])
      end
    else
      flash[:alert] = "Song not found"
      redirect_to artist_songs_path(params[:artist_id])
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
