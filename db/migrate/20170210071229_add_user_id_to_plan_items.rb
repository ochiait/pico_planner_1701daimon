class AddUserIdToPlanItems < ActiveRecord::Migration[5.0]
  def change
    add_column :plan_items, :user_id, :integer
  end
end
