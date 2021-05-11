class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_buyer = PurchaseBuyer.new
    @product = Product.find(params[:product_id])
    if @product.purchase.present? || @product.user_id == current_user.id
      redirect_to root_path
    end
  end
  def create
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    @product = Product.find(params[:product_id])
    if @purchase_buyer.valid?
      pay_item
      @purchase_buyer.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_buyer).permit(:zip_code, :prefecture_id, :municipality, :address, :building, :phone_number ).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
