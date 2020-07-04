# == Schema Information
#
# Table name: events
#
#  id                                                                    :bigint           not null, primary key
#  accepted(参加者数)                                                    :integer          default(0), not null
#  address(開催場所)                                                     :string           default(""), not null
#  catch(キャッチ)                                                       :text             default(""), not null
#  connpass_event_url(connpass.com 上のURL)                              :string           default(""), not null
#  connpass_updated_at(connpass.com 上のイベント更新日時 (ISO-8601形式)) :datetime         not null
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
class Event < ApplicationRecord
  has_many :event_movies
  has_many :movies, through: :event_movies

  validates :title, presence: true, length: {maximum: 255}
  validates :catch, presence: true
  validates :connpass_event_url, presence: true
  validates :hash_tag, presence: true, length: {maximum: 255}
  validates :started_at, presence: true
  validates :ended_at, presence: true
  validates :limit, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, length: {maximum: 7}
  validates :event_type, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :place, presence: true
  validates :accepted, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0 }, length: {maximum: 7}
  validates :waiting, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0 }, length: {maximum: 7}
  validates :connpass_event_id, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
  validates :connpass_updated_at, presence: true

end
