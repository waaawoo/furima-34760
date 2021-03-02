class RemoveConditionItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :condition_id, :integer
    remove_column :items, :condition, :integer
  end
end
