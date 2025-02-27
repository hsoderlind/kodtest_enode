class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show edit update destroy ]

  # GET /order_items or /order_items.json
  def index
    @order_items = OrderItem.includes(:order).all
    render json: @order_items
  end

  # GET /order_items/1 or /order_items/1.json
  def show
    render json: @order_item
  end

  # GET /order_items/new or /order_items/new.json
  def new
    @order_item = OrderItem.new
    render json: @order_item
  end

  # POST /order_items or /order_items.json
  def create
    @order_item = Order.find(params(:order_id)).order_items.create(order_item_params)
    if @order_item.saved_changes?
      render json: @order_item
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  # GET /order_items/1/edit or /order_items/1/edit.json
  def edit
    render json: @order_item
  end

  # PATCH/PUT /order_items/1 or /order_items/1.json
  def update
    if @order_item.update(order_item_params)
      render json: @order_item
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_items/1 or /order_items/1.json
  def destroy
    @order_item.destroy
    render json: { message: "Order Item deleted successfully" }
  end

  private
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_item_params
      params.expect(:item [:order_id, :product_id, :product_name, :quantity, :price, :ttotal])
    end
end
