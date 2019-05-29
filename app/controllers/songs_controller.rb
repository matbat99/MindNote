class SongsController < ApplicationController

  def create
    artist = Artist.find_or_create_by(name: params[:artist])
    album = params[:album_url]
    album.gsub!(/source\/*.*.jpg/, "source/300x300bb.jpg")
    song = Song.create(title: params[:title], artist: artist, album_url: album)
    practice = Practice.create!(user: current_user, song: song)
    redirect_to '/'
  end

  private

  def songs_params
    # don't know how to do this
  end
end
