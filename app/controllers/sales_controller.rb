class SalesController < ApplicationController
  def create
    Sale.create(sale_params)
  end

  private

  def sale_params
    params.require(:sale).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
