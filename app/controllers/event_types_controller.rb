class EventTypesController < ApplicationController
  before_action :authenticate_user!
  require 'will_paginate/array'
  before_action :set_event_type, only: [:show, :edit, :update, :destroy]

  # GET /event_types
  # GET /event_types.json
  def index
    @event_types = EventType.all.paginate(page: params[:event_type_page], per_page: 15)
  end

  # GET /event_types/1
  # GET /event_types/1.json
  def show
  end

  # GET /event_types/new
  def new
    @event_type = EventType.new
  end

  # GET /event_types/1/edit
  def edit
  end

  # POST /event_types
  # POST /event_types.json
  def create
    @event_type = EventType.new(event_type_params)

    respond_to do |format|
      if @event_type.save
        #BEFORE
        # format.html { redirect_to @event_type, notice: 'Event type was successfully created.' }
        # format.json { render :show, status: :created, location: @event_type }
        #AFTER
        format.html { redirect_to '/admin#event_types_tab', notice: 'Event type was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @event_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_types/1
  # PATCH/PUT /event_types/1.json
  def update
    respond_to do |format|
      if @event_type.update(event_type_params)
        format.html { redirect_to '/admin#event_types_tab', notice: 'Event type was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_type }
      else
        format.html { render :edit }
        format.json { render json: @event_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_types/1
  # DELETE /event_types/1.json
  def destroy
    @event_types = EventType.with_deleted.find(params[:id])
    if params[:type]=='normal'
      @event_type.delete
      respond_to do |format|
        format.html { redirect_to event_types_url, notice: 'Event type was successfully removed.' }
        format.json { head :no_content }
      end
    elsif params[:type]=='restore'
      @event_type.restore
      @event_type.update(deleted_at: nil)
      respond_to do |format|
        format.html { redirect_to '/admin#activity_tab', notice: 'Event type was successfully restored.' }
        format.json { head :no_content }
      end
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_type
      @event_type = EventType.with_deleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_type_params
      params.require(:event_type).permit(:event_type_desc)
    end
end
