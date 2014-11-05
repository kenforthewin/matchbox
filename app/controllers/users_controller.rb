class UsersController < ApplicationController

	def create
		spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

		if User.exists?(spotify_id: spotify_user.id)
			@user = User.where(spotify_id: spotify_user.id).first
			session[:current_user_id] = @user.id
			return redirect_to root_path
		end

		@user = User.new
		@user.spotify_hash = spotify_user.to_hash
		@user.spotify_name = spotify_user.display_name
		@user.spotify_id = spotify_user.id

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
		@sorted = @sorted.first(20)

		@user.top_artists = @sorted
		@user.save
		session[:current_user_id] = @user.id

		redirect_to root_path
	end

	def home
		if current_user != nil
			@top = current_user.top_artists
		end
	end

	def account
			@top = current_user.top_artists
	end

	def match
		@user = current_user

		@top = @user.top_artists

		@matches = User.where
	end

	def destroy
		session[:current_user_id] = nil
		redirect_to root_path
	end


end
