class SongsController < ApplicationController

  def create
    song_data = JSON.parse(params[:radios])
    if song_data["artistName"].nil?
      redirect_to root_path
    else
      artist = Artist.find_or_create_by(name: song_data["artistName"])
      album = song_data["artworkUrl100"]
      album.gsub!(/source\/*.*.jpg/, "source/600x600bb.jpg")
      song = Song.create(title: song_data["trackName"], artist: artist, album_url: album)
      practice = Practice.new(user: current_user, song: song)
      if practice.save
        redirect_to :root
      else
        render "home"
      end
    end
  end

  private

  def songs_params
    # don't know how to do this
  end
end
