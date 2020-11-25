class AddDeletedAtToMovies < ActiveRecord::Migration[6.0]
  def up
    add_column :movies, :deleted_at, :datetime, comment: "削除日時"
  end

  def down
    remove_column :movies, :deleted_at
  end
end
