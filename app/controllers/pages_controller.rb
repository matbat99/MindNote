class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :landing
  def home
    @songs_due = Practice.urgent_songs(current_user.id)
    @first = @songs_due.first
  end

  def landing

  end
end
