class SessionsController < ApplicationController
  def create
    @time = params[:time]
    practice = Practice.find(params[:practice_id])
    grade = params[:star].to_i
    grade = 1 if grade < 2

    session = Session.new(grade: grade, practice: practice)
    session.time = @time
    practice.next_interval(session.grade)
    practice.active = true
    practice.save
    if session.save
      if practice.interval == 1
        day = "Tommorow"
      else
        day = "on #{(DateTime.now + practice.interval).strftime('%A, %b %d')}"
      end

      flash.notice = "You will see this song again #{day}"
      redirect_to :root
    else
      render practice # don't know if this works
    end
  end

  def new
    @practice = Practice.find(params[:practice_id])
    @session = Session.new
    @time = params[:time]
    @formatted_time = convert_time(@time.to_i)
  end

  def destroy
    @session = Session.find(params[:id])
    @session.destroy
  end

  private

  def convert_time(milliseconds)
    return '' unless milliseconds

    hours, milliseconds   = milliseconds.divmod(1000 * 60 * 60)
    minutes, milliseconds = milliseconds.divmod(1000 * 60)
    seconds, milliseconds = milliseconds.divmod(1000)
    "#{hours}h #{minutes}m #{seconds}s"
  end
end
