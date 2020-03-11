require "spotify_latest_favo_maker/version"
require 'rspotify'
require 'rspotify/oauth'
require 'byebug'

module RSpotify
  class Track
    attr_accessor :added_at
  end
end

module SpotifyLatestFavoMaker
  class Error < StandardError; end
  def self.main(client_id, client_secret, month_count)
    RSpotify.authenticate(client_id, client_secret)
    # OAuth
    puts "Please OAuth from: https://accounts.spotify.com/ja/authorize?client_id=#{client_id}&response_type=token&redirect_uri=http:%2F%2Flocalhost:3000%2F&scope=playlist-modify-private%20user-library-read%20playlist-modify-public"
    puts "And input URL query 'access_token'"
    token = gets.chomp
    puts "And input your spotify user_name"
    user_name = gets.chomp
    auth = { 'id' => user_name, 'credentials' => {'token' => token } }
    @me = RSpotify::User.new(auth)

    all_tracks = []
    until_time = (Date.today << month_count).to_time
    limit = 20
    page = 0

    loop  {
      tracks = @me.saved_tracks(limit: limit, offset: limit * page).each { |t| t.added_at = @me.tracks_added_at[t.id] }
      all_tracks.push(*tracks)
      if tracks.last.added_at < until_time
        break
      else
        page = page + 1
      end
    }

    puts "Generate playlists with: #{all_tracks.map(&:name).join("\n")}"

    playlist = @me.create_playlist!("saved between #{Date.parse(until_time.to_s).to_s}/#{Date.today.to_s}")

    adding_tracks = all_tracks.filter { |t| t.added_at > until_time }
    adding_tracks.each_slice(10) { |tracks|
      playlist.add_tracks!(tracks)
    }

    puts "url: #{playlist.external_urls}"
  end
  attr_accessor :me
end
