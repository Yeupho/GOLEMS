class ColorsController < ApplicationController
  before_action :authenticate_user!
  require 'will_paginate/array'
  before_action :set_color, only: [:show, :edit, :update, :destroy, :restore]

  # GET /colors
  # GET /colors.json
  def index
    @colors = Color.all.paginate(page: params[:color_page], per_page: 15)
  end

  # GET /colors/1
  # GET /colors/1.json
  def show
  end


  # POST /colors
  # POST /colors.json
  def create
    @color = Color.new(color_params)

    respond_to do |format|
      if @color.save
        format.html { redirect_to '/admin#colors_tab01', notice: 'Color was successfully created.' }
        format.json { render :show, status: :created, location: @color }
      else
        format.html { render :new }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colors/1
  # PATCH/PUT /colors/1.json
  def update
    respond_to do |format|
      if @color.update(color_params)
        format.html { redirect_to '/admin#colors_tab01', notice: 'Color was successfully updated.' }
        format.json { render :show, status: :ok, location: @color }
      else
        format.html { render :edit }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colors/1
  # DELETE /colors/1.json
  def destroy
    @colors = Color.with_deleted.find(params[:id])
    if params[:type]=='normal'
      @color.delete
      respond_to do |format|
        format.html { redirect_to '/admin#colors_tab01', notice: 'Color was successfully removed.' }
        format.json { head :no_content }
      end
    elsif params[:type]=='restore'
      @color.restore
      @color.update(deleted_at: nil)
      respond_to do |format|
        format.html { redirect_to '/admin#colors_tab01', notice: 'Color was successfully restored.' }
        format.json { head :no_content }
      end
    end

  end

  def restore
    @color = Color.with_deleted.find(params[:id])
    @color.restore(:id)
    @color.update(deleted_at: nil)
    respond_to do |format|
      format.html { redirect_to '/admin#colors_tab01' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color
      @color = Color.with_deleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_params
      params.require(:color).permit(:color_code, :color_name)
    end
end
