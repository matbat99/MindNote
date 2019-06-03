class NotesController < ApplicationController
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

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
