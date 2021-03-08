# Formおオブジェクトクラス
class BuyerHistoryInfo
  # activeモデルをインクルード
  include ActiveModel::Model
  # 保存したいカラム名を全て指定（ゲッターセッターを定義でき、form_withで使用できる）
  attr_accessor :item_id, :user_id,
                :post_num, :area_id, :municipalities, :address, :builing_name, :phone_num

  # バリデーション
  with_options presence: true do
    validates :post_num
    validates :area_id
    validates :municipalities
    validates :address
    validates :phone_num
    validates :item_id
    validates :user_id
    # validates :buyer_histories_id
  end

  # 保存処理
  def save
    # ヒストリーテーブル
    buyer_history = BuyerHistory.create(user_id: user_id, item_id: item_id)
    # infoテーブル
    binding.pry
    @a = BuyerInfo.create(
      # 外部キーとカラム名とモデルは同一名じゃないと紐づかない
      buyer_history_id:  buyer_history.id,
      post_num:           post_num,
      area_id:            area_id,
      municipalities:     municipalities,
      address:            address,
      builing_name:       builing_name,
      phone_num:          phone_num
    )
    binding.pry
    @a.valid?
  end
end
