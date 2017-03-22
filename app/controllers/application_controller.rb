class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def new_release
    respond_to do |format|
        format.html
        format.js
    end
  end

end
