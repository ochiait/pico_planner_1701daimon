class AddUserIdToPlanItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :plan_items, :user, index: true
  end
end
