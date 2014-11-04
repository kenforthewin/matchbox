Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "fe75164f7fa048d2a58bf8f251def1d8", "9f17104c1b82404ebc7723cb4804b698", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify playlist-read-private user-read-private playlist-modify-private'
end