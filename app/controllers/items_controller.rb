class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.all.order("created_at ASC")
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  def item_params
    params.require(:item).permit(:name,:text,:category,:product_state,:delivery,:prefecture,:days,:price, :image).merge(user_id: current_user.id)
  end

end
