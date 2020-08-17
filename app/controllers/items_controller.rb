class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :correct_user?, only: [:edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
    # (params[:id])でitem_id(出品商品のid)を作成
  end

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :text,
      :category_id,
      :product_state_id,
      :delivery_id,
      :prefecture_id,
      :day_id,
      :price,
      :user_id
      # user_idはユーザー登録の時に作成されたidなので増えたりはしない。増えるのは(item_)id
    ).merge(user_id: current_user.id)
  end

  def correct_user?
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
