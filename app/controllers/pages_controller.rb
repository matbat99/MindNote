class PagesController < ApplicationController
  def home
    @unlearned = current_user.practices.where(active: false)
    @songs_due = Practice.urgent_songs(current_user.id).count
  end
end
