class ProductsController < ApplicationController
  before_action :authenticate_user!
  require 'will_paginate/array'
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.paginate(page: params[:product_page], per_page: 15)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to '/admin#products_tab01',notice: 'Product was successfully created.'}
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to '/admin#products_tab01',notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @products = Product.with_deleted.find(params[:id])
    if params[:type]=='normal'
      @product.destroy
      respond_to do |format|
        format.html { redirect_to '/admin#products_tab01',notice: 'Product was successfully deleted.' }
        format.json { head :no_content }
      end
    elsif params[:type]=='restore'
      @product.restore
      @product.update(deleted_at: nil)
      respond_to do |format|
        format.html { redirect_to '/admin#products_tab01',notice: 'Product was successfully restored.' }
        format.json { head :no_content }
      end
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.with_deleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_name, :product_price, :product_type_id, :archive)
    end
end
