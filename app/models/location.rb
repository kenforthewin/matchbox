# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Location < ActiveRecord::Base
	belongs_to :user
	acts_as_mappable :auto_geocode => true
end
