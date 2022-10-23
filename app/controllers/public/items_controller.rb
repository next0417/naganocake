class Public::ItemsController < Public::ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def item_params
    params.require(:item).permit(:id, :name, :image, :introduction, :price, :genre_id, :is_active, :amount)
  end
end
