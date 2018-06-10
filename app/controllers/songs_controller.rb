class SongsController < ApplicationController
  def index
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      if @artist.nil?
        redirect_to artists_path, alert: "Artist Not Found"
        #alert is part of flash
      #good way to do it
      else
        @songs = @artist.songs
        #@songs equals the specific songs for the artist
      end
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id]
      #it makes sense why :artist_id is the params by following the code: 
      #    In song#show, the helper display_artist is called. It's available to all classes bec it's in a module
      #    #display_artist makes an add artist link to show up if there's no artist
      #    and a link to the artist name with a path of artist_songs_path with the @song instance, established in the show action
      #    in SongsController. And in the scope of Song, a @song instance knows the artist by :artist_id 
      #don't forget: you can start off code in a block for an action with an if statement
      @artist = Artist.find_by(id: params[:artist_id])
      @song = @artist.songs.find_by(id: params[:id] )
      
      #??? the artist can be found as an instance of the artist where the user input (params) is a value of the id hash?
      
      if @song.nil?
      
          #you can call #nil as a method
    
        redirect_to artist_songs_path(@artist), alert: "Song Not Found"
      #you don't ALWAYS need an else/elsif!
      #you don't need to redirect it to the show path because it's already on that path!!
      
      end        
    else @song = Song.find(params[:id])
    
      # params is not just for input here ! It's for telling Rails what to retrieve, too!

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

