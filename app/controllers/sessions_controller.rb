class SessionsController < ApplicationController
  def create
    practice = Practice.find(params[:practice_id])
    grade = params[:star].to_i
    session = Session.new(grade: grade, practice: practice)
    practice.next_interval(session.grade)
    practice.active = true
    practice.save
    if session.save
      flash.notice = "You rehearsed #{practice.song.title} and rated it #{practice.sessions.last.grade} stars"
      redirect_to :root
    else
      render practice # don't know if this works
    end
  end

  def new
    @practice = Practice.find(params[:practice_id])
    @session = Session.new
  end

  def destroy
    @session = Session.find(params[:id])
    @session.destroy
  end
end
