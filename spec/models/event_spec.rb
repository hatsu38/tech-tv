# == Schema Information
#
# Table name: events
#
#  id                                                                    :bigint           not null, primary key
#  accepted(参加者数)                                                    :integer          default(0), not null
#  address(開催場所)                                                     :string           default(""), not null
#  applicant(応募者数)                                                   :integer          default(0), not null
#  catch(キャッチ)                                                       :text             default(""), not null
#  connpass_event_url(connpass.com 上のURL)                              :string           default(""), not null
#  connpass_updated_at(connpass.com 上のイベント更新日時 (ISO-8601形式)) :datetime         not null
#  deleted_at(削除日時)                                                  :datetime
#  description(概要)                                                     :text             default(""), not null
#  ended_at(イベント終了日時 (ISO-8601形式))                             :datetime         not null
#  event_type(イベント参加Type)                                          :string           default(""), not null
#  hash_tag(Twitterのハッシュタグ)                                       :string           default(""), not null
#  lat(開催会場の緯度)                                                   :float
#  limit(定員)                                                           :integer          default(0), not null
#  lon(開催会場の経度)                                                   :float
#  place(開催会場)                                                       :string           default(""), not null
#  started_at(イベント開催日時 (ISO-8601形式))                           :datetime         not null
#  title(タイトル)                                                       :string           not null
#  waiting(補欠者数)                                                     :integer          default(0), not null
#  created_at                                                            :datetime         not null
#  updated_at                                                            :datetime         not null
#  connpass_event_id(connpass.com 上のイベントID)                        :integer          not null
#
# Indexes
#
#  index_events_on_connpass_event_id  (connpass_event_id) UNIQUE
#
require "rails_helper"

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
