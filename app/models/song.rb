class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :same_year_check
  validates :released, presence: true
  validate :release_year_check
  validates :artist_name, presence: true

  def same_year_check
    if artist_name.present? && released
      if !Song.where(title: title, artist_name: artist_name, release_year: release_year).first.nil?
        errors.add(:title, "Artist cannot release a song with the same title in the same year.")
      end
    end
  end

  def release_year_check
    if released
      if release_year.present?
        errors.add(:realse_year, "Release year cannot be in the future") if release_year > Time.now.year
      else
        errors.add(:release_year, "Release year must be present if released is true.")
      end
    end
  end
end
