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

  extend OrderAsSpecified

  def self.related_event_many_order(num = nil)
    ranking_tag_ids = joins(:events).group(:tag_id).count.sort_by{ |_, v| -v }.map(&:first)
    tags = where(id: ranking_tag_ids).order_as_specified(id: ranking_tag_ids)
    return tags if num.nil?

    tags.limit(num)
  end
end
