class SongsController < ApplicationController
  protect_from_forgery except: :create # disabled forgery protection until we can figure out how to do this in JS

  def create
    raise
  end
end
