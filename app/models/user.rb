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
#

class User < ActiveRecord::Base
	serialize :top_artists, Array
	serialize :spotify_hash, Hash
end
