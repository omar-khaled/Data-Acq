class ErrorsController < ApplicationController
  def routing
  	flash[:error] = "Invalid URL!"
    redirect_to :controller => 'records', :action => 'index'
  end
end
