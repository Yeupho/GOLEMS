class DashboardsController < ApplicationController
  before_action :authenticate_user!
  require 'will_paginate/array'

  def index
    @check_in = CustomerEvent.check_in
    @employee_list = EmployeeEvent.employee_list
    @event_list = Event.event_list.paginate(page: params[:event_list_page], per_page: 2)
    @party_size = CustomerEvent.party_size

    @studio_fee = Fake.twoweeksprior_studio
    @transactions = Fake.twoweeksprior_transactions
  end
end

