class CreateEventTags < ActiveRecord::Migration[6.0]
  def change
    create_table :event_tags, comment: "イベントとタグの紐付け" do |t|
      t.references :event, null: false, foreign_key: true, comment: "イベントID"
      t.references :tag, null: false, foreign_key: true, comment: "タグID"

      t.timestamps
    end
  end
end
