class AddressesController < ApplicationController
  def index
    @addresses = current_user.addresses
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user

    if @address.save
      flash[:success] = "Address added successfully"
      redirect_to addresses_path
    else
      render 'new'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])

    if @address.update(address_params)
      flash[:success] = "Address has been updated"
      redirect_to addresses_path
    else
      render 'edit'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:success] = "Address has been successfully removed"
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:first_name,:last_name,:country,:city,:street,
                                   :post_code,:phone,:user_id)
  end
end