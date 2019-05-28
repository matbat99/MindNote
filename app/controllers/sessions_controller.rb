class SessionsController < ApplicationController
  def create
    practice = Practice.find(params[:practice_id])
    grade = params[:grade][:grade].to_i
    session = Session.new(grade: grade, practice: practice)
    if session.save
      redirect_to :root
    else
      render practice # don't know if this works
    end
  end
end
