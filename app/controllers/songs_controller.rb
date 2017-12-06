class SongsController < ApplicationController

  def index
     if params[:artist_id]
       @songs = Artist.find(params[:artist_id]).songs
     else
       @songs = Song.all
     end
   end

   def show
     @song = Song.find(params[:id])

     if @song == nil
       render template: 'artists/show'
     else
       render template: 'songs/show'
     end
   end
end
