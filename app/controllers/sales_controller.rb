class SalesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :not_selling_user?, only: [:index, :create]
  before_action :is_sold_out, only: [:index]
  
  
  def index
  end


  def create
    @sale = ItemSale.new(sale_params)
    if @sale.valid?
      pay_item
      @sale.save
      @item.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  

  private
 
  def set_item
    @item = Item.find(params[:item_id])
  end


  def sale_params
    params.permit(
      :token,
      :post_code,
      :pref_id,
      :city,
      :street,
      :building,
      :tel,
      :item_id
    ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: sale_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def not_selling_user?
    redirect_to root_path if current_user == @item.user
  end

  def is_sold_out
    redirect_to root_path if @item.sale != nil
  end
  
end
