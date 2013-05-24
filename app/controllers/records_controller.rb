class RecordsController < ApplicationController

  

# each time this method runs all record are saved wich results in duplicates
  def test
    b = require_user
    uploaded_file = params[:file]
    if uploaded_file == nil
      flash[:error] = "Must select the measurements file."
      redirect_to :action => 'new'
      return

    else
      file_content = uploaded_file.read
      puts "xxxxxxxxxxxxxxxxxxxxxxzxzxzxzxzcxcxcxzczxcxzczcxxcxzczxcxcxzczxczxcxcxzczxczxczxczxczxczxczxczxczxczxczxczxczxczxc"
      m = file_content.split( /\r?\n/ )
      if m != nil
        for r  in m
          l = r.split("\t")
          if is_number?(l[0]) && is_number?(l[1])
          t = Record.new(:time => l[0] , :value => l[1].to_f ,:comment => "1")
          t.save
          #puts "recorded added"
          else
            flash[:error] = "Must select the measurements file."
            redirect_to :action => 'new'
            return            
            #puts "recorded rejected"
          end
        end
      end
      puts "xxxxxxxxxxxxxxxxxxxxxxzxzxzxzxzcxcxcxzczxcxzczcxxcxzczxcxcxzczxczxcxcxzczxczxczxczxczxczxczxczxczxczxczxczxczxczxc"
      #for r in m 
        #t = Record.new(:value => r.to_f , :comment => "1")
        #t.save
      #end
      flash[:success] = "Readings added successfuly."
      redirect_to :action => 'index'
    end
  end

  def new
    b = require_user
  end

  def index
    b = require_user
    require 'will_paginate/array'
    @all = Record.all
    @all = @all.paginate(:per_page => 25, :page=> params[:page])
    #@new = Record.order('created_at DESC').all
    @new = Record.find(:all, :order => "created_at DESC", :limit => 50)
    @today = Record.find(:all, :conditions => ["DATE(created_at) = ?", Date.today])
  end

  def speed
    b = require_user
    require 'will_paginate/array'
    @all = Record.find(:all, :conditions => ["comment = ? ", "1"])
    @all = @all.paginate(:per_page => 25, :page=> params[:page])
    @new = Record.find(:all, :conditions => ["comment = ? ", "1"] , :order => "created_at DESC", :limit => 50)
    @today = Record.find(:all,  :conditions => ["comment = ? ", "1"], :conditions => ["DATE(created_at) = ?", Date.today])
  end

  def direction
    b = require_user
    require 'will_paginate/array'
    @all = Record.find(:all, :conditions => ["comment = ? ", "2"])
    @all = @all.paginate(:per_page => 25, :page=> params[:page])
    @new = Record.find(:all, :conditions => ["comment = ? ", "2"] , :order => "created_at DESC", :limit => 50)
    @today = Record.find(:all, :conditions => ["comment = ? ", "2"] , :conditions => ["DATE(created_at) = ?", Date.today])
  end

  def solar
    b = require_user
    require 'will_paginate/array'
    @all = Record.find(:all, :conditions => ["comment = ? ", "3"])
    @all = @all.paginate(:per_page => 25, :page=> params[:page])
    @new = Record.find(:all,:conditions => ["comment = ? ", "3"], :order => "created_at DESC", :limit => 50)
    @today = Record.find(:all, :conditions => ["comment = ? ", "3"], :conditions => ["DATE(created_at) = ?", Date.today])
  end

end
