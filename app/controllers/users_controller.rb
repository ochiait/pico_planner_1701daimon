class UsersController < ApplicationController

  # 新規作成フォーム
  def new
    @user = User.new
  end

  # ユーザの新規登録
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "ユーザを登録しました。"
    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
