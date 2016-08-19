class Artist < ActiveRecord::Base
  has_many :songs

  def self.ids_include?(id)
    where('id IN ?', pluck(:id))
  end
end
