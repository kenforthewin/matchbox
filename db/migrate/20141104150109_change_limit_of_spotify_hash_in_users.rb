class ChangeLimitOfSpotifyHashInUsers < ActiveRecord::Migration
  def change
  	change_column :users, :spotify_hash, :text, :limit => nil
  end
end
