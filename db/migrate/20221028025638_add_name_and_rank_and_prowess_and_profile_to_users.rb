class AddNameAndRankAndProwessAndProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :rank, :integer
    add_column :users, :prowess, :string
    add_column :users, :profile, :string
  end
end
