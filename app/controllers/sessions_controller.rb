class SessionsController < ApplicationController
  def index
    authenticate_user
    @user = current_user
  end

  def new
  end

  def create
    if params[:name].empty?
      redirect_to action: :new
    else
      session[:name] = params[:name]
      redirect_to action: :index
    end
  end

  def destroy
    session.delete :name unless session[:name].nil?
    redirect_to action: :new
  end
end
