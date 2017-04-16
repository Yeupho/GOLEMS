class AboutController < ApplicationController

  def index
    @user=Admin.DailyPurchase
  end
  def new
  end

  def create
    @user = 'glazedover@gmail.com'
    ContactmailMailer.deliver_contact(@user)
  end
end
