class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :full_name, null: false
    	t.string :name, null: false
    	t.string :hashed_password 
      t.timestamps
    end
  end
end
