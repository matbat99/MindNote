class SessionsController < ApplicationController
  def create
    practice = Practice.find(params[:practice_id])
    grade = params[:star].to_i
    session = Session.new(grade: grade, practice: practice)
    practice.next_interval(session.grade)
    practice.active = practice.sessions.present?
    practice.save
    if session.save
      redirect_to :root
    else
      render practice # don't know if this works
    end
  end

  def new
    @practice = Practice.find(params[:practice_id])
    @session = Session.new
  end
end
