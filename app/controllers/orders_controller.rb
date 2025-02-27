class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  #  GET /orders or /orders.json
  def index
    @orders = Order.includes(:order_items).all
    render json: @orders
  end

  #  GET /orders/1 or /orders/1.json
  def show
    render json: @order
  end

  # GET /orders/new or /orders/new.json
  def new
    @order = Order.new
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    if params[:use_points] == true && order_params[:subtotal] > 150
      subtotal = order_params[:subtotal]
      discount = 0
      points = Customer.find(order_params[:customer_id]).points.all
      for  point in points do
        if point.used_points >= point.allocated_points
          next
        end

        if point.allocated_points > subtotal
          points_used = point.allocated_points - subtotal
        else
          points_used = point.allocated_points
        end

        discount += points_used
        point.update(used_points: (point.used_points || 0) + points_used)
        subtotal -= points_used

        if subtotal == 0
          break
        end
      end

      @order.discount = -discount
      @order.total = subtotal - discount
    end

    if @order.save
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # GET /orders/1/edit or /orders/1/edit.json
  def edit
    render json: @order
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    render json: { message: "Order deleted successfully" }
  end

  private
    def set_order
      @order = Order.includes(:order_items).find(params[:id])
    end

    def order_params
      params.expect(order: [ :customer_id, :subtotal, :total ])
    end
end
