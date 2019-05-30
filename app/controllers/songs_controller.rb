class SongsController < ApplicationController
  def create

    #test if anything came in params -- in case user backs out without selection
    if params[:artist].nil?
      redirect_to root_path
    else
      artist = Artist.find_or_create_by(name: params[:artist])
      album = params[:album_url]
      album.gsub!(/source\/*.*.jpg/, "source/600x600bb.jpg")
      song = Song.find_or_create_by(title: params[:title], artist: artist, album_url: album)
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
