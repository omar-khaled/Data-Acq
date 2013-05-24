class UserSessionsController < ApplicationController

before_filter :require_user,  :only => [:destroy]

  def new
    if current_user_session != nil 
      redirect_to :controller => "records" , :action => "index" 
      return
    end
    @user_session = UserSession.new
  end

  def create
    if current_user_session != nil 
      redirect_to :controller => "records" , :action => "index" 
      return
    end
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      #flash[:notice] = "Login successful!"
      redirect_to :controller => "records" , :action => "index" 
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    #flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end

end
