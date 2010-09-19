class UsersController < ApplicationController

  before_filter :authorize, :except => [:index, :new, :create, :show, :suggest]
  
  def index
    @users = User.find :all
  end
  
  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(root_url, :notice => 'Registration was successful.')
      @user.send_notification("Welcome to GlobeTrotter.")
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find current_user

    if @user.update_attributes(params[:user])
      redirect_to(root_url, :notice => 'Your profile was successfully updated.')
    else
      render :action => "edit"
    end

  end

  def suggest
    users = User.search("*#{params[:q]}*")
    data = Array.new
    users.each do |user|
      data << {"name" => "#{user.username} (#{user.email})", "image" => "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}.jpg", "value" => "#{user.id}"}
    end
    respond_to do |format|
      format.json { render :json => data }
    end
  end  
end
