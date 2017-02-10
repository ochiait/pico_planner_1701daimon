class PlanItemsController < ApplicationController
  # 予定一覧
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @plan_items = @user.plan_items
    else
      @plan_items = PlanItem.all
    end
    @plan_items = @plan_items.order(created_at: :desc)
            # .paginate(page: params[:page], per_page: 5)
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
    # 要確認
    # @plan_item.user = current_user
    if @plan_item.save
      redirect_to @plan_item, notice: "予定を追加しました。"
    else
      render "new"
    end
  end

  # 更新
  def update
    @plan_item = current_user.plan_items.find(params[:id])
    @plan_item.assign_attributes(plan_item_params)
    if @plan_item.save
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

  private def plan_item_params
    params[:plan_item].permit(
      :name, :description,
      :starts_at_date_part, :starts_at_time_part,
      :ends_at_date_part, :ends_at_time_part
    )
  end
end
