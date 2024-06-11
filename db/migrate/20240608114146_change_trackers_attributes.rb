class ChangeTrackersAttributes < ActiveRecord::Migration[7.1]
  def change
    change_column :trackers, :weight, :float

    change_column_null :trackers, :weight, false
    change_column_null :trackers, :repetitions, false
  end
end
