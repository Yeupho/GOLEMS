class EventsController < ApplicationController
  require 'will_paginate/array'
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.find_by_sql("SELECT * FROM events e WHERE e.event_type_id <> '7'").paginate(page: params[:event_page], per_page: 4)
    @event = Event.new
    @customer_event = CustomerEvent.new
    @walk_ins = CustomerEvent.find_by_sql("SELECT * FROM customer_events ce JOIN events e ON e.id = ce.event_id WHERE e.event_type_id = '7' ORDER BY e.start_time ASC").paginate(page: params[:walk_in_page], per_page: 10)

  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new(event_params)
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :show }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :show }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.with_deleted.find(params[:id])
    if params[:type] == 'normal'
      @event.destroy
    elsif params[:type] == 'restore'
      @event.restore
    end

    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.with_deleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_name, :event_date, :start_time, :end_time, :event_type_id, :color_id, :event_status_id, :event_description)
    end
end
