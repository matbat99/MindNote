class PracticesController < ApplicationController
  require 'open-uri'
  def index
    @practices = current_user.practices
  end

  def create

  end

  def show
  end

  def destroy
    @practice = Practice.find(params[:id])
    @practice.destroy
    redirect_to practices_path
  end

  def learn
    @practice = Practice.find(params[:id])
    @practice.update(active: true)
    redirect_to practices_path
  end

  def song_search
    search_term = params[:query]
    @songs = []
    response = open("https://itunes.apple.com/search?term=#{search_term}&entity=musicTrack&limit=5").read
    json = JSON.parse(response)
    json['results'].each do |song|
      @songs << { title: song['trackName'], album_url: song['collectionViewUrl'] }
    end
    render '/pages/home'
  end
end
