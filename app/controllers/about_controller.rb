class AboutController < ApplicationController
  before_action :authenticate_user!

  def index

  end
  def new
  end

  def create
    @user = 'glazedover@gmail.com'
    ContactmailMailer.deliver_contact(@user)
  end
end
