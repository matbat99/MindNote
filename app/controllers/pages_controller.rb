class PagesController < ApplicationController
  def home
    @song = Song.new
    @unlearned = Practice.where(active: false)[0..3]
  end
end
