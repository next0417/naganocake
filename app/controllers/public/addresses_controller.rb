class Public::AddressesController < Public::ApplicationController
  def create
    @newaddress = Address.new(address_params)
    @newaddress.customer_id = current_customer.id
    @newaddress.save!
    @adresses = current_customer.addresses
    redirect_to addresses_path
  end

  def index
    @customer = current_customer
    @newaddress = Address.new
    @address = @customer.address
    @adresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
