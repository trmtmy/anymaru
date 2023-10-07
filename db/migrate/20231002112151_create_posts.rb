class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :introduction, null: false, default: ""
      t.integer :category, null: false, default: ""
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
