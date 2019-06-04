class PracticesController < ApplicationController
  before_action :find_song, only: [:show, :destroy, :learn]
  require 'open-uri'
  def index
    @practices = current_user.practices
  end

  def show
    @note = Note.new
  end

  def destroy
    @practice = Practice.find(params[:id])
    message_holder = @practice.song.title
    @sessions = @practice.sessions
    @sessions.each { |session| session.destroy }
    @practice.notes.each { |note| note.destroy }
    @practice.destroy
    flash.notice = "#{message_holder} removed from your list"
    redirect_to practices_path
  end

  def review
    @practices = Practice.urgent_songs(current_user.id)
  end

  def progress
    @practices = current_user.practices
    @user_total_sessions = []
    @practices.select { |practice| practice.sessions.each { |session| @user_total_sessions << session } }
    @last_session = @user_total_sessions.max_by {|session| session.created_at }
    grade_sum = 0
    @user_total_sessions.each { |session| grade_sum += session.grade }
    if @user_total_sessions.count > 0
      @average_grade = grade_sum / @user_total_sessions.count
    else
      @average_grade = 1
    end
    @number_of_total_sessions = 0
    @practices.each { |practice| @number_of_total_sessions += practice.sessions.count }
  end

  def statistics
    @practice = Practice.find(params[:id])
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
