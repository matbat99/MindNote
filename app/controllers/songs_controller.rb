class SongsController < ApplicationController
  protect_from_forgery except: :create # disabled forgery protection until we can figure out how to do this in JS

  def create
    artist = Artist.create!(name: params[:artist])
    song = Song.create!(title: params[:title], artist: artist, album_url: params[:album_url])
    practice = Practice.create!(user: current_user, song: song)
    redirect_to '/'
  end

  private

  def songs_params
    # don't know how to do this
  end
end
