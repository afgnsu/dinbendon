class OrdersController < ApplicationController
  # before_action 是指會在該 action 執行前會觸發的方法，在這裏，執行 show, edit, update, 和 destroy 前，
  # 都需要先搜尋單筆資料 @order = Order.find(params[:id])
  # 為了避免寫重複的程式碼，我們可以把尋找單筆資料的程式碼打包成一個 method: set_order
  # 請到這個 class 底下看 set_order 的實作方法
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # index 這個方法是對映到訂單列表頁面
  def index
    @orders = Order.all
    # 搜尋出所有的訂單資料，並存入 @orders 這個實例變數裡
    # 在 controller 方法裡定義的實例變數是可以被相對映的
    # 前端 html.erb 樣板使用
  end

  # GET /orders/1
  def show
    # 對映到顯示單筆資料的頁面
  end

  # GET /orders/new
  def new
    # 創造出一筆空資料，並且與新增頁面的空白表單綁定
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    # 對映到編輯單筆資料的頁面
  end

  # POST /orders
  # POST /orders.json
  def create
    # 前端傳回的資料，呼叫 order_params 過濾前端傳回來的資料，用 new 創出一個 Order 的物件 (此時還是 ruby 物件喔)
    @order = Order.new(order_params)

    respond_to do |format|
      # save 是指把該筆 物件裡的資料存入資料庫內
      if @order.save
        # 若儲存成功，就導回該筆資料的 show 頁面
        format.html { redirect_to order_path(@order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        # 若儲存失敗，就導回新增的頁面重新填寫資料
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  def update
    respond_to do |format|
      # 呼叫 order_params 過濾前端傳回來的資料，並且更新，若更新成功，就導回該筆資料的 show 頁面
      if @order.update(order_params)
        format.html { redirect_to order_path(@order), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        # 若更新失敗，就導回編輯的頁面重新填寫資料
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      # 用 params[:id] 裡面的值去搜尋需要做 show / update / edit / destroy 的單筆資料
      @order = Order.find(params[:id])
    end

    def order_params
      # 永遠不要相信從前端傳回來的東西，require 和 permit 會把 params 這個複雜的 hash 裡的資料過濾
      # 只留下 params[:order][:name]
      #       params[:order][:phone]
      #       params[:order][:description]
      #       params[:order][:age]
      # 剛好是我們建立一筆訂單所需要的資料
      params.require(:order).permit(:name, :email, :description, :age)
    end
end
