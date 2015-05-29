class AddDrugsDataUsagePercetage < ActiveRecord::Migration
  def up
    add_column :drugs, :usage_percentage, :float
  end

  def down
    remove_column :drugs, :usage_percentage
  end
end
