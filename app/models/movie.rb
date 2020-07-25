# == Schema Information
#
# Table name: movies
#
#  id                   :bigint           not null, primary key
#  deleted_at(削除日時) :datetime
#  url(動画のURL)       :string           default(""), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_movies_on_url  (url) UNIQUE
#
class Movie < ApplicationRecord
  has_many :event_movies
  has_many :events, through: :event_movies

  validates :url, presence: true, uniqueness: true

  scope :published, -> { where(deleted_at: nil)}

  def logical_delete
    self.update(deleted_at: Time.zone.now)
  end

  def restore
    self.update(deleted_at: nil)
  end

  def youtube_id
    self.url.gsub(/http.:\/\/youtu.be\//, '')
  end

  def thumbnail_url
    "https://img.youtube.com/vi/#{self.youtube_id}/0.jpg"
  end

  def embed_youtube_url
    "https://www.youtube.com/embed/#{self.youtube_id}"
  end
end
