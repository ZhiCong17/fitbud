class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :gender, :string
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :age, :integer
    add_column :users, :fitness_goal, :string
  end
end
