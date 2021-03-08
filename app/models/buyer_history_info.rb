# Formおオブジェクトクラス
class BuyerHistoryInfo
  # activeモデルをインクルード
  include ActiveModel::Model
  # 保存したいカラム名を全て指定（ゲッターセッターを定義でき、form_withで使用できる）
  attr_accessor :item_id, :user_id,
                :post_num, :area_id, :municipalities, :address, :builing_name, :phone_num, :token

  # バリデーション
  with_options presence: true do
    # ハイフンが必要
    validates :post_num, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id
    validates :municipalities
    validates :address
    # 11桁いないんで数値のみ
    validates :phone_num, format: { with: /\A\d{11}\z/}
    validates :item_id
    validates :user_id
    validates :token
  end

  # 保存処理
  def save
    # ヒストリーテーブル
    buyer_history = BuyerHistory.create(user_id: user_id, item_id: item_id)
    # infoテーブル
    BuyerInfo.create(
      # 外部キーとカラム名とモデルは同一名じゃないと紐づかない
      buyer_history_id:  buyer_history.id,
      post_num:           post_num,
      area_id:            area_id,
      municipalities:     municipalities,
      address:            address,
      builing_name:       builing_name,
      phone_num:          phone_num
    )
  end
end
