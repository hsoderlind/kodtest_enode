class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ show edit update destroy ]

  def index
    @cart_items = @current_customer.get_cart.cart_items
    render json: @cart_items
  end

  def show
    render json: @cart_item
  end

  def new
    @cart_item = CartItem.new
    render json: @cart_item
  end

  def create
    @cart_item = @current_customer.get_cart.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  def edit
    render json: @cart_item
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def cart_item_params
      params.expect(item: [ :product_id, :quantity, :price, :total ])
    end
end
