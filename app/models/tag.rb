# == Schema Information
#
# Table name: tags
#
#  id           :bigint           not null, primary key
#  name(名前)   :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Tag < ApplicationRecord
  has_many :event_tags
  has_many :events, through: :event_tags

  GET_DEFAULT_RELATED_RANKING_TAG_NUMS = 10

  def self.related_event_many_order(num = GET_DEFAULT_RELATED_RANKING_TAG_NUMS)
    ranking_tag_ids = joins(:event_tags).group(:tag_id).count.sort_by{ |_, v| -v }.map(&:first).first(num)
    where(id: ranking_tag_ids).sort_by {|m| ranking_tag_ids.index(m.id)}
  end
end
