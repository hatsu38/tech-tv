class AddDeletedAtToEvents < ActiveRecord::Migration[6.0]
  def up
    add_column :events, :deleted_at, :datetime, comment: "削除日時"
  end

  def down
    remove_column :events, :deleted_at
  end
end
