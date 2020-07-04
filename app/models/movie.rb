# == Schema Information
#
# Table name: movies
#
#  id                     :bigint           not null, primary key
#  url(動画のURL)         :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  event_id(イベントのID) :bigint           not null
#
# Indexes
#
#  index_movies_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#
class Movie < ApplicationRecord
  belongs_to :event
end
