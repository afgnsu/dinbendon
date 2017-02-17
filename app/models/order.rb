# 一個 Model 是對映到一個資料庫的資料表，Order 就是對映到
# 這個專案的資料庫裡的 users 資料表
class Order < ApplicationRecord
  # 在 rails 的層面做資料驗證
  # 一筆訂單的訂購者應該要填名字，不然不給建立一筆訂單
  validates :name, presence: true
  # 訂購者的名字不應該只有一個字元
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 10 }
  # 訂購者的 email 是必填，不然無法聯絡
  validates :email, presence: true
end
