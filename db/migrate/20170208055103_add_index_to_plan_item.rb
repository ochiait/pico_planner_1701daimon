class AddIndexToPlanItem < ActiveRecord::Migration[5.0]
  def change
    add_index :plan_items, [:user_id, :created_at]
  end
end
