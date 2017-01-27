class LoginsController < ApplicationController
  def show
      render "new"
  end

  def create
    user = User.find_by_name params[:name]
    if user && user.authenticate(params[:pass])
      session[:id] = user.id
      redirect_to :root
    else
      # flash変数にメッセージをセット
      flash.now.alert = "もう一度入力してください。"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to login_path
  end
end
