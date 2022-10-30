class Admin::OrdersController < Admin::ApplicationController
  def show
    @customer = current_customer
    @order = Order.find(params[:id])
    @shopping_cost = 800
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:id, :status)
  end
end
