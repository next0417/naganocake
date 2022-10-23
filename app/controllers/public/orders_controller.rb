class Public::OrdersController < Public::ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
  end

  def confirmation
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @shopping_cost = 800
    @total = 0
    if payment_method = "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif payment_method = "1"
      @address = Address.find(params[:order][:address_id])
    else
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end

  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |a|
        ordering_product = OrderingProduct.new
        ordering_product.item_id = a.item_id
        ordering_product.order_id = @order.id
        ordering_product.amount = a.amount
        ordering_product.price = a.item.price
        ordering_product.save
      end
      redirect_to orders_thanks_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = Order.all
    @cart_items = CartItem.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method)
  end
end
