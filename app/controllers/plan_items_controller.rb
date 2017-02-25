class PlanItemsController < ApplicationController
  # 予定一覧
  def index
    if current_user
      @user = current_user
      @plan_items = @user.plan_items
    else
      @plan_items = PlanItem.all
    end
    @plan_items = @plan_items.order(created_at: :desc)
            .paginate(page: params[:page], per_page: 5)
  end

  # 予定詳細
  def show
    @plan_item = PlanItem.find(params[:id])
  end

  def new
    @plan_item = PlanItem.new
    time0 = Time.current.beginning_of_hour
    @plan_item.starts_at = time0.advance(hours: 1)
    @plan_item.ends_at = time0.advance(hours: 2)
  end

  def edit
    @plan_item = current_user.plan_items.find(params[:id])
  end

  # 新規作成
  def create
    @plan_item = PlanItem.new(plan_item_params)
    @plan_item.user = current_user
    if @plan_item.save
      redirect_to @plan_item, notice: "予定を追加しました。"
    else
      Rails.logger.info @plan_item.errors.full_messages
      render "new"
    end
  end

  # 更新
  def update
    @plan_item = current_user.plan_items.find(params[:id])
    @plan_item.assign_attributes(plan_item_params)
    if @plan_item.save
      @plan_item.participants = User.where(id: params[:participants][:ids])
      # @plan_item.participations.destroy_all # Easy solution
      # ids0 = @plan_item.participations.pluck(:user_id)
      # ids1 = params[:participants][:ids].map(&:to_i).reject { |e| e == 0 }
      # a = ids1 - ids0
      # b = ids0 - ids1
      # raise [ids0, ids1, a, b].inspect
      # a.each do |id|
      #   user = User.find_by(id: id)
      #   if user
      #     @plan_item.participants << user
      #   end
      # end

      # b.each do |id|
      #   user = User.find_by(id: id)
      #   if user
      #     @plan_item.participants.destroy(user)
      #   end
      # end
      redirect_to @plan_item, notice: "予定を更新しました。"
    else
      render "edit"
    end
  end

  # 削除
  def destroy
    @plan_item= current_user.plan_items.find(params[:id])
    @plan_item.destroy
    redirect_to :plan_items, notice: "予定を削除しました。"
  end

  # 参加者追加
  def participate
    # @plan_item = PlanItem.new(plan_item_params)
    # @plan_item.user = current_user
    # if @plan_item.save
    #   redirect_to @plan_item, notice: "予定を追加しました。"
    # else
    #   Rails.logger.info @plan_item.errors.full_messages
    #   render "new"
    # end
  end

  private def plan_item_params
    params[:plan_item].permit(
      :name, :description,
      :starts_at_date_part, :starts_at_time_part,
      :ends_at_date_part, :ends_at_time_part
    )
  end
end
