class UsersController < ApplicationController

	def spotify

		if(current_user.spotify_hash != nil)
			spotify_user = RSpotify::User.new(current_user.spotify_hash)
		end

		if(spotify_user == nil)
			spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
			current_user.spotify_hash = spotify_user.to_hash
			current_user.save
		end

		playlists = spotify_user.playlists(limit: 50)

		playlists.delete_if { |playlist| playlist.public == false && playlist.owner != spotify_user}


		top = Hash.new

		playlists.each do |playlist|
			playlist.tracks.each do |track|
				track.artists.each do |artist|
					if top.assoc(artist.id) != nil && artist.id != nil
						artHash = Hash[artist.id, top[artist.id] + 1]
						top.merge!(artHash)
					elsif artist.id != nil
						artHash = Hash[artist.id, 1]
						top.merge!(artHash)
					end
				end
			end
		end

		@sorted = top.sort_by { |id, count| count }.reverse!

		current_user.top_artists = @sorted
		current_user.save!
	end

	def home
		@top = current_user.top_artists
	end


end
