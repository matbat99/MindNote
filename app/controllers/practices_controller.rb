class PracticesController < ApplicationController
  def index
    @practices = current_user.practices
  end

  def create
  end

  def show
  end

  def destroy
  end

  def learn
  end
end
