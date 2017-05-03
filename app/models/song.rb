class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :same_year_check
  validates :release, presence: true
  validate :release_year_check
  validates :artist_name, presence: true

  def same_year_check
    binding.pry
    if artist_name.artist_name.present? && released
      Song.where(artist_name: self.artist_name, release_year: self.release_year)
    # checks if the same artist has released a song with the same title in the same year
  end

  def release_year_check
    # Optional if released is true
    # checks if present
    # Can not be a futrure year
  end
end
