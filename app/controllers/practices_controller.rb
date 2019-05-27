class PracticesController < ApplicationController
  require 'open-uri'
  def index
  end

  def create

  end

  def show
  end

  def destroy
  end

  def learn
  end

  def song_search
    search_term = params[:query]
    @songs = []
    response = open("https://itunes.apple.com/search?term=#{search_term}&entity=musicTrack&limit=5").read
    json = JSON.parse(response)
    json['results'].each do |song|
      @songs << {title: song['trackName'], album_url: song['collectionViewUrl'],)
    end
    raise
    render '/pages/home'
  end
end
