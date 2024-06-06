class CreatePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :plans do |t|
      t.integer :progress
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
