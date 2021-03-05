class CreateBuyerInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_infos do |t|
      t.references :buyer_histories, foreign_key: true
      t.string :post_num, null: false
      t.integer :area_id, null: false
      t.string :municipalities, null: false
      t.string :address, null: false
      t.string :builing_name
      t.string :phone_num, null:false
      t.timestamps
    end
  end
end
