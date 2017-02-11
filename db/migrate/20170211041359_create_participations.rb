class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.references :user, null: false, index: true
      t.references :plan_item, null: false, index: true

      t.timestamps
    end
  end
end
