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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
