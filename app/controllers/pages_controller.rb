class PagesController < ApplicationController
  def home
    @song = Song.new
  end
end
