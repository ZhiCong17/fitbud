class AddCurrentDayToPlans < ActiveRecord::Migration[7.1]
  def change
    add_column :plans, :current_day, :integer, default: 0, null: false
  end
end
