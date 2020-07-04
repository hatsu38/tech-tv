# == Schema Information
#
# Table name: event_movies
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :bigint           not null
#  movie_id   :bigint           not null
#
# Indexes
#
#  index_event_movies_on_event_id  (event_id)
#  index_event_movies_on_movie_id  (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (movie_id => movies.id)
#
require 'rails_helper'

RSpec.describe EventMovie, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
