class AddConditionIdItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :condition, :integer
  end
end
