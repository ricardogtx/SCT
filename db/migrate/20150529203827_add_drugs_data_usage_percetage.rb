class AddDrugsDataUsagePercetage < ActiveRecord::Migration
  def up
    add_column :drugs, :usage_percentage, :float
    add_column :drugs, :death_rate, :float
  end

  def down
    remove_column :drugs, :usage_percentage
    remove_column :drugs, :death_rate
  end
end
