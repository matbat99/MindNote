class NotesController < ApplicationController
  def index
    @practice = Practice.find(params[:practice_id])
    @notes = @practice.notes
  end

  def create
    @practice = Practice.find(params[:practice_id])
    @note = Note.new(note_params)
    @note.practice = @practice
    if @note.save
      flash.notice = "Your note has been saved"
    else
      flash.notice = "make sure you write something"
    end
    redirect_to practice_path(@practice)
  end

  def show
    @note = Note.find(params[:id])
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
