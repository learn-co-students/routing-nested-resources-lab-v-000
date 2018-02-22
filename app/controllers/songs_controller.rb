class SongsController < ApplicationController
  
  def index
    if params[:artist_id]
      @artist = Artist.find_by_id(params[:artist_id])
      
      if @artist.nil?
        flash[:alert] =  "Artist not found"
        redirect_to artists_path
       
      else 
        @songs = @artist.songs
      end 
    else
      @songs = Song.all
    end
  end
# find(params)-- defaults to id/  find_by(.. .=> looks for the column name or id )

  # def show
  #   if params[:artist_id]
  #     binding.pry
  #     @artist = Artist.find_by_id(params[:artist_id])
  #     @song = @artist.songs.find_by(id: params[:id]) 
  #       if @song.nil? 
      
  #       else 
  #          flash[:alert] =  "Song not found"
  #          redirect_to to artist_songs_path(@artist)
  #        end 
 
  #   else
  #     @song = Song.find_by(params[:id])
  #   end
  # end

# find_by fails silently. Creepy default, will return something. 

 def show
    if params[:artist_id]
      @artist = Artist.find_by_id(params[:artist_id])
     
      if !@artist.nil?
         @song = @artist.songs.find_by(:id => params[:id])

         if @song.nil? 
            # redirect_to artist_song_path(@artist, @song)
           flash[:alert] =  "Song not found"
           redirect_to artist_songs_path(@artist)
         end 
      end
    else
      @song = Song.find_by(:id => params[:id])
    end
  end

# artist yes, song no 
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

