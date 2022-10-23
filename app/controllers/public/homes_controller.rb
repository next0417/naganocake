class Public::HomesController < Public::ApplicationController
  def top
    @items = Item.page(params[:page])
  end

  def about
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :genre_id, :is_active)
  end
end
