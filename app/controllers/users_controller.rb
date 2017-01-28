class UsersController < ApplicationController
  before_action :login_required, except:[:new, :create]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to @user
    else
      render "edit"
    end
  end


  def create
    @user = User.new(params[:user])
    if @user.save
      flash.notice = "created"
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash.alert = "not created"
      render "new"
    end
  end

  def destroy
  end

end
