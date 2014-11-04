class AddTopArtistsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :top_artists, :text
  end
end
