class SongsController < ApplicationController
  def create
    if params[:radios].nil?
      redirect_to root_path
    else
      song_data = JSON.parse(params[:radios])
      artist = Artist.find_or_create_by(name: song_data["artistName"])
      album = song_data["artworkUrl100"]
      album.gsub!(/source\/*.*.jpg/, "source/600x600bb.jpg")
      song = Song.find_or_create_by(title: song_data["trackName"], artist: artist, album_url: album)
      practice = Practice.new(user: current_user, song: song)
      if practice.save
        flash.notice = "You added #{practice.song.title}"
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
