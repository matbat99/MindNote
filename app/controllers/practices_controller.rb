class PracticesController < ApplicationController
  before_action :find_song, only: [:show, :destroy, :learn]
  require 'open-uri'
  def index
    @practices = current_user.practices
  end

  def show
  end

  def destroy
    @practice.destroy
    redirect_to practices_path
  end

  def learn
    @practice.update(active: true)
    redirect_to practices_path
  end

  private

  def find_song
    @practice = Practice.find(params[:id])

  end

  # def song_search
  #   search_term = params[:query]
  #   @songs = []
  #   response = open("https://itunes.apple.com/search?term=#{search_term}&entity=musicTrack&limit=5").read
  #   json = JSON.parse(response)
  #   json['results'].each do |song|
  #     @songs << {title: song['trackName'], album_url: song['collectionViewUrl'],)
  #   end
  #   raise
  #   render '/pages/home'
  # end
end
