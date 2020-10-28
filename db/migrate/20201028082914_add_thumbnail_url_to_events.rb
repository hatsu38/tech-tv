class AddThumbnailUrlToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :thumbnail_url, :string, null: false, default: "", after: :title, comment: "サムネイルURL"
  end
end
