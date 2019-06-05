class PlaylistsController < ApplicationController
  def index
  end

  def show
    playlist_id = params[:playlist_id]
    access_token = params[:access_token]
    url = "https://api.spotify.com/v1/playlists/#{playlist_id}/tracks"
    playlist_data = JSON.parse(open(url, "Authorization" => "Bearer #{access_token}").read)
    @songs = playlist_data["items"]
  end

  def create
    if params[:songs].nil?
      redirect_to root_path
    else
      data = params[:songs]
      @songs = data.map { |song| JSON.parse(song) }
      # raise
      @songs.each do |song_data|
        artist = Artist.find_or_create_by(name: song_data["artist"])
        song = Song.find_by(title: song_data["name"], artist: artist)

        song = Song.create(title: song_data["name"], artist: artist, album_url: song_data["url"]) if song.nil?

        Practice.create(user: current_user, song: song)
      end
      flash.notice = "You Imported #{@songs.count} Songs"
      redirect_to :root
    end
  rescue JSON::ParserError => e
    flash.notice = "Sorry something went wrong, please try again"
    redirect_to :root
  end
end
