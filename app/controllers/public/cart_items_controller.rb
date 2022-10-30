class Public::CartItemsController < Public::ApplicationController
  def index

    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @new_cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @new_cart_item.present?
      new_amount = @new_cart_item.amount + params[:cart_item][:amount].to_i
      @new_cart_item.update(amount: new_amount)
    else
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
