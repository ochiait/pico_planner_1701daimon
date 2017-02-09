class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.references :user, null: false, index: true  # 外部キーとインデックス
      t.string :name, null: false                    # 名前
      t.text :description                            # 説明
      t.datetime :created_at, null: false              # 投稿日

      t.timestamps null: false
    end
  end
end
