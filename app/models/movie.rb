# == Schema Information
#
# Table name: movies
#
#  id             :bigint           not null, primary key
#  url(動画のURL) :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_movies_on_url  (url) UNIQUE
#
class Movie < ApplicationRecord
  has_many :event_movies
  has_many :events, through: :event_movies

  validates :url, presence: true, uniqueness: true
end
