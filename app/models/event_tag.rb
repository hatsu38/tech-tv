# == Schema Information
#
# Table name: event_tags
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  event_id(イベントID) :bigint           not null
#  tag_id(タグID)       :bigint           not null
#
# Indexes
#
#  index_event_tags_on_event_id  (event_id)
#  index_event_tags_on_tag_id    (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (tag_id => tags.id)
#
class EventTag < ApplicationRecord
  belongs_to :event
  belongs_to :tag
end
