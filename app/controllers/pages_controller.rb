class PagesController < ApplicationController
  def home
    @song = Song.new
    @unlearned = current_user.practices.where(active: false)
    @songs_due = Practice.urgent_songs(current_user.id).count
  end
end
