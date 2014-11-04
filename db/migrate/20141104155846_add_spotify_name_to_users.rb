class AddSpotifyNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :spotify_name, :string
  end
end
