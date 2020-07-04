class CreateEvents < ActiveRecord::Migration[6.0]
  def up
    create_table :events, comment: 'イベント' do |t|
      t.string :title, null: false, comment: 'タイトル'
      t.text :catch, null: false, default: "", comment: 'キャッチ'
      t.text :description, null: false, default: "", comment: '概要'
      t.string :connpass_event_url, null: false, default: "", comment: 'connpass.com 上のURL'
      t.string :hash_tag, null: false, default: "", comment: 'Twitterのハッシュタグ'
      t.datetime :started_at, null: false, comment: 'イベント開催日時 (ISO-8601形式)'
      t.datetime :ended_at, null: false, comment: 'イベント終了日時 (ISO-8601形式)'
      t.integer :limit, null: false, default: 0, comment: '定員'
      t.string :event_type, null: false, default: "", comment: 'イベント参加Type'
      t.string :address, null: false, default: "", comment: '開催場所'
      t.string :place, null: false, default: "", comment: '開催会場'
      t.float :lat, comment: '開催会場の緯度'
      t.float :lon, comment: '開催会場の経度'
      t.integer :accepted, null: false, default: 0, comment: '参加者数'
      t.integer :waiting, null: false, default: 0, comment: '補欠者数'
      t.integer :connpass_event_id, null: false, unique: true, comment: 'connpass.com 上のイベントID'
      t.datetime :connpass_updated_at, null: false, comment: 'connpass.com 上のイベント更新日時 (ISO-8601形式)'

      t.timestamps
    end
  end
end
