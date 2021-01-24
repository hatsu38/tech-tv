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
#  thumbnail_url(サムネイルURL)                                          :string           default(""), not null
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
  include DatetimeFormat
  has_many :event_movies, dependent: :destroy
  has_many :movies, through: :event_movies

  has_many :event_tags, dependent: :destroy
  has_many :tags, through: :event_tags

  validates :title, presence: true, length: { maximum: 255 }
  validates :connpass_event_url, presence: true
  validates :started_at, presence: true
  validates :ended_at, presence: true
  validates :limit, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                    length: { maximum: 10 }
  validates :event_type, presence: true, length: { maximum: 255 }
  validates :accepted, presence: true,
                       numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                       length: { maximum: 10 }
  validates :waiting, presence: true,
                      numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                      length: { maximum: 10 }
  validates :applicant, presence: true,
                        numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                        length: { maximum: 10 }
  validates :connpass_event_id, presence: true,
                                numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :connpass_updated_at, presence: true

  scope :recent, -> { where(started_at: [(Time.zone.today.beginning_of_day - 2.weeks)..Time.zone.today.end_of_day]) }
  scope :monthly, -> { where(started_at: [(Time.zone.today.beginning_of_day - 1.month)..Time.zone.today.end_of_day]) }
  scope :popular, -> { order(applicant: :desc) }
  scope :newly, -> { where(created_at: [(Time.zone.today.beginning_of_day - 10.days)..Time.zone.today.end_of_day]) }
  scope :serch_by_keyword, lambda { |serch|
    where("title LIKE ?", "%#{serch}%")
      .or(where("catch LIKE ?", "%#{serch}%"))
      .or(where("hash_tag LIKE ?", "%#{serch}%"))
  }

  scope :select_columns, lambda {
    select(
      :id, :title, :catch, :connpass_event_url, :hash_tag,
      :started_at, :ended_at, :thumbnail_url, :limit,
      :accepted, :waiting, :applicant
    )
  }
  scope :popular_event_tags, ->(num = 10) { popular.limit(num).map(&:tags).flatten.compact.uniq }
  scope :published, -> { where(deleted_at: nil) }

  DEFAULT_GET_EVENTS_NUMS = 10

  def logical_delete
    update(deleted_at: Time.zone.now)
  end

  def restore
    update(deleted_at: nil)
  end

  def self.published_popular_select_tags_with_movies_tags
    joins(:movies).distinct.preload(:tags, :movies).published.select_columns.popular
  end

  def tweet_text
    # Pickを使うとSQLをまた引いてしまうのでlast.urlとしている
    url = movies.last&.url || connpass_event_url
    <<~USAGE
      #{title}
      #{format_datetime(started_at)}から開催 ##{hash_tag}
      #{url}
    USAGE
  end
end
