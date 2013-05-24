class UsersController < ApplicationController

before_filter :require_user,  :only => [:show, :edit, :update]

  def new
    if current_user != nil
      current_user_session.destroy
      redirect_to "/users/new"
    end
    @user = User.new
  end

  def show
    flash[:error] = "Invalid URL!"
    redirect_to :controller => 'records', :action => 'index'
  end

  def create
    @user = User.new(params[:user])

    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
   	puts "xxxxxxxxxxxxxxxxxxxxxxzxzxzxzxzcxcxcxzczxcxzczcxxcxzczxcxcxzczxczxcxcxzczxczxczxczxczxczxczxczxczxczxczxczxczxczxc"
   	puts @user
    puts "xxxxxxxxxxxxxxxxxxxxxxzxzxzxzxzcxcxcxzczxcxzczcxxcxzczxcxcxzczxczxcxcxzczxczxczxczxczxczxczxczxczxczxczxczxczxczxc"


    @user.login = 'xxx'
    if @user.save
      redirect_to "/content"
    else
      render :action => :new
    end

  end

end
