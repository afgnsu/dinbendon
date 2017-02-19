class AddPasswordDigestToUser < ActiveRecord::Migration[5.0]
  def change
    # add_column 是一個 migration 的方法，用於在現有資料表增加一個欄位
    # 三個參數分別是要改變的資料表名稱、新增的欄位名稱、和該欄位的資料型別
    add_column :users, :password_digest, :string
  end
end
