class AddbuyerHistoriesIdTobuyerInfos < ActiveRecord::Migration[6.0]
  def change
    remove_column :buyer_infos, :buyer_histories_id, :references
    add_reference :buyer_infos, :buyer_history, foreign_key: true
  end
end
