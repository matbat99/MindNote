class PagesController < ApplicationController
  def home
    @songs_due = Practice.urgent_songs(current_user.id)
    @first = @songs_due.first
  end
end
