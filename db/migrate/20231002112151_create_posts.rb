class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :introduction, null: false
      t.integer :category, null: false
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
