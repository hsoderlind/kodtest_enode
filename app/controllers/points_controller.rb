class PointsController < ApplicationController
  before_action :set_point, only: %i[ show edit update destroy ]

  # GET /points or /points.json
  def index
    @points = @current_customer.points
    render json: @points
  end

  # GET /points/1 or /points/1.json
  def show
    render json: @point
  end

  # GET /points/new
  def new
    @point = Point.new
    render json: @point
  end

  # GET /points/1/edit
  def edit
    render json: @point
  end

  # POST /points or /points.json
  def create
    @point = Customer.find(point_params[:customer_id]).points.create(point_params)
    if @point.saved_changes?
      render json: @point, status: :created
    else
      render json: @point.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /points/1 or /points/1.json
  def update
    if @point.update(point_params)
      render json: @point
    else
      render json: @point.errors, status: :unprocessable_entity
    end
  end

  # DELETE /points/1 or /points/1.json
  def destroy
    @point.destroy
    render json: { message: "Point deleted successfully" }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def point_params
      params.expect(point: [ :customer_id, :order_id, :allocated_points, :used_points ])
    end
end
