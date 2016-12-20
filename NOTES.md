NOTES.md



1. change to nested routes, indicate only those you need (#index, #show)


2. change the controllers (nested one, not parent) for the chosen actions (#index, #show)
#index
if params[:parent_id]
	find parent's posts
else
	show all

#show	
find the post by it's id

3. Update your link helpers
check "rake routes | grep parent ..."
index is 	artist_songs_path(@artist)
show is 	artist_song_path(@artist, @song)