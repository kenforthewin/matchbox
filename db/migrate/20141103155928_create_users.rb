class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :spotify_hash
      t.string :identifier

      t.timestamps
    end
  end
end
