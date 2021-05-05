class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.includes(:user).order("created_at DESC")
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @product = Product.find(params[:id])
  end
  def edit
    @product = Product.find(params[:id])
    unless user_signed_in? && current_user.id == @product.user_id
      redirect_to root_path
    end
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products: :edit
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :until_delivery_id, :price).merge(user_id: current_user.id)
  end
end
