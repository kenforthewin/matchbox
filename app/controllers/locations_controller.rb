class LocationsController < ApplicationController

	def new
		@location = Location.new
	end

	def create
		@location = Location.new(location_params)
		@location.save
	end

	def address
	end

	private

	def location_params
		params.require(:location).permit(:user_id)
	end
end
