# == Schema Information
#
# Table name: event_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :bigint           not null
#  tag_id     :bigint           not null
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
require 'rails_helper'

RSpec.describe EventTag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
