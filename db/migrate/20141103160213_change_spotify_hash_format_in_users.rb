class ChangeSpotifyHashFormatInUsers < ActiveRecord::Migration
  def change
  	change_column :users, :spotify_hash, :text
  end
end
