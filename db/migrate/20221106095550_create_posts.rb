class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :weapon
      t.string :battle
      t.string :comment
      t.integer :head_main
      t.integer :head_sub1
      t.integer :head_sub2
      t.integer :head_sub3
      t.integer :body_main
      t.integer :body_sub1
      t.integer :body_sub2
      t.integer :body_sub3
      t.integer :shoes_main
      t.integer :shoes_sub1
      t.integer :shoes_sub2
      t.integer :shoes_sub3
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
