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
    @practice = Practice.find(params[:practice_id])
    @note = Note.find(params[:id])
  end

  def update
    @practice = Practice.find(params[:practice_id])
    @note = Note.find(params[:id])
    content = params[:note][:content]
    @note.content = content
    @note.save!
    redirect_to practice_notes_path(@practice)
  end

  def destroy
    @practice = Practice.find(params[:practice_id])
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to practice_notes(@practice)
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
