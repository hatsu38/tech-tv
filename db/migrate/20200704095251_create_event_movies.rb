class CreateEventMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :event_movies do |t|
      t.references :event, null: false, foreign_key: true, comment: "イベントID"
      t.references :movie, null: false, foreign_key: true, comment: "動画ID"

      t.timestamps
    end

    add_index :event_movies, %i[event_id movie_id], unique: true
  end
end
