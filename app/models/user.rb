# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  spotify_hash :text
#  identifier   :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  top_artists  :text
#  spotify_name :string(255)
#  spotify_id   :string(255)
#  latitude     :float
#  longitude    :float
#

class User < ActiveRecord::Base
	serialize :top_artists, Array
	serialize :spotify_hash, Hash

	geocoded_by :ip_address, :latitude => :latitude, :longitude => :longitude
	after_validation :geocode
end
