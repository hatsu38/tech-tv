class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies, comment: '動画' do |t|
      t.string :url, null: false, default: "", comment: '動画のURL'
      t.references :event, null: false, foreign_key: true, comment: 'イベントのID'

      t.timestamps
    end
  end
end
