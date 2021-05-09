class PurchasesController < ApplicationController
  before_action :sold_item, only: [:index]

  def index
    @purchase_buyer = PurchaseBuyer.new
    @product = Product.find(params[:product_id])
  end
  def create
    # binding.pry
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    @product = Product.find(params[:product_id])
    if @purchase_buyer.valid?
      @purchase_buyer.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_buyer).permit(:zip_code, :prefecture_id, :municipality, :address, :building, :phone_number ).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def sold_item
    if @product.present?
      redirect_to root_path
    end
  end
end
