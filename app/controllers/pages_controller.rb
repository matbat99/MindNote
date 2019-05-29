class PagesController < ApplicationController
  def home
    @song = Song.new
    @unlearned = Practice.where(active: false)
  end
end
