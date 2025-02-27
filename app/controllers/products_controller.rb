class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
    render json: @products
  end

  # GET /products/1 or /products/1.json
  def show
    render json: @product
  end

  # GET /products/new or /products/new.json
  def new
    @product = Product.new
    render json: @product
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /products/1/edit or /products/1/edit.json
  def edit
    render json: @product
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.expect(product: [ :name,  :price, :description, :stock ])
    end
end
