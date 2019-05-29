class PagesController < ApplicationController
  def home
    @song = Song.new
    @unlearned = current_user.practices.where(active: false)
  end
end
