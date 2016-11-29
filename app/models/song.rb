class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end
<<<<<<< HEAD

=======
>>>>>>> 60f92d6495cfaaf6c144bf137258bd9b693bbaaf
end
