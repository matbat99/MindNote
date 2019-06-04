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
      respond_to do |format|
        format.html do
          flash.notice = "Your note has been saved"
          redirect_to practice_path(@practice)
        end
        format.js
      end
    else
      flash.notice = "make sure you write something"
      redirect_to practice_path(@practice)
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
