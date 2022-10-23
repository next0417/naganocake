class Admin::HomesController < Admin::ApplicationController
  def top
    @orders = Order.page(params[:page])
    @ordering_products = OrderingProduct.all
  end


end
