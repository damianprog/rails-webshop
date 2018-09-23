class CreditCardsController < ApplicationController
  def index
    @credit_cards = current_user.credit_cards
  end

  def new
    @credit_card = CreditCard.new
  end

  def create
    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.user = current_user

    if @credit_card.save
      flash[:success] = "New credit card has been saved"
      redirect_to credit_cards_path
    else
      render 'new'
    end
  end

  def edit
    @credit_card = CreditCard.find(params[:id])
  end

  def update
    @credit_card = CreditCard.find(params[:id])

    if @credit_card.update(credit_card_params)
      flash[:success] = "Credit card has been updated successfully"
      redirect_to credit_cards_path
    else
      render 'edit'
    end
  end

  def destroy
    @credit_card = CreditCard.find(params[:id])
    @credit_card.destroy

    flash[:success] = "Credit card has been removed successfully"
    redirect_to credit_cards_path
  end

  private

  def credit_card_params
    params.require(:credit_card).permit(:first_name,:last_name,:card_number,
                                :month_expiration,:year_expiration,:security_code,:phone_number)
  end
end