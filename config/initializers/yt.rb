Yt.configure do |config|
  config.api_key = Rails.application.secrets['yt_server_key']
end