[x] spec/controllers/artists
[x] spec/controllers/songs - controllers 2nd
[] spec/features/songs - 3rd
[] spec/features/artists - 4th
[x] spec/helpers
[x] spec/models
[x] spec/routing - handle routes first
[x] spec/views


[x] Create nested resource routes to show all songs for an artist (`/artists/1/songs`) and individual songs for that artist (`/artists/1/songs/1`). Restrict the nested songs routes to `index` and `show` actions only.
[x] Update the artists `index` view to use the new nested resource route URL helper to link to the index of all songs by that artist.
[x] Update the artists `show` view to list each song for that artist, and use the new nested resource route helper to link each song to its corresponding `show` page.
[x] Update the `songs_controller` to allow the `songs#index` and `songs#show` actions to handle a valid song for the artist.
[x] In the `songs#index` action, if the artist can't be found, redirect to the `index` of artists, and set a `flash[:alert]` of "Artist not found."
[x] In the `songs#show` action, if the song can't be found for a given artist, redirect to the `index` of the artist's songs and set a
`flash[:alert]` of "Song not found."
