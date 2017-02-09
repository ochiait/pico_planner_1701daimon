class EntriesController < ApplicationController
  before_action :login_required, except: [:index, :show]
  def index
      if params[:user_id]
        @user = User.find(params[:user_id])
        @entries = @user.entries
      else
        @entries = Entry.all
      end
      @entries = @entries.order(created_at: :desc)
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new(created_at: Time.current)
  end

  def edit
    @entry = current_user.entries.find(params[:id])
  end
end
