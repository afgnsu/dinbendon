class SessionsController < ApplicationController
  def new
    # 對映登入頁面
  end

  def create
    # 尋找使用者
    user = User.find_by(name: params[:name])   
    # 驗證使用者，若成功，就建立一個 session，把 user_id 放入 session hash
    # 這行程式碼可以解讀成，若使用者存在並且 password 通過比對，就代表驗證成功
    if user && user.authenticate(params[:password])
      # 這裏的 session 可以想像成是把 browser 的 cookie 被轉成一個 hash
      # 若驗證成功，就把該筆 user 的 id 放入 cookie
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    # 登出畫面使用，刪除 session hash 裡面的 user_id
    session[:user_id] = nil
    redirect_to root_path
  end
end
