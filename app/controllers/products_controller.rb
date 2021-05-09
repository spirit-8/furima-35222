class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :applicable_user, only: [:edit, :update, :destroy]


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
  end
  def edit
    if @product.purchase.present?
      redirect_to root_path
    end
  end
  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end
  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :until_delivery_id, :price).merge(user_id: current_user.id)
  end
  def set_product
    @product = Product.find(params[:id])
  end
  def applicable_user
    unless current_user.id == @product.user_id
      redirect_to root_path
    end
  end
end
