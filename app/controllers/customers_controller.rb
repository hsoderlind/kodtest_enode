class CustomersController < ApplicationController
  before_action :set_customer, only: [ :show, :edit, :update, :destroy ]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all
    render json: @customers
  end

  # GET /customers/1 or /customers/1.json
  def show
    render json: @customer
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    render json: @customer
  end

  # GET /customers/1/edit
  def edit
    render json: @customer
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @campaign.destroy
    render json: { message: "Campaign deleted" }
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.expect(customer: [ :name, :email, :password ])
    end
end
