class PracticesController < ApplicationController
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
end
