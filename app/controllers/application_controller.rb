class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def index
    if !current_user.nil?
      filter = []
      @my_apps = Appointment.joins(:client).where("user_id = ?", current_user.id)

      if !params[:paid].blank?
        paid = params[:paid]
        filter << ["copay_received = '#{paid.to_s}'"]
      end

      if !params[:effective_on].blank?
        junk = params[:effective_on]
        filter << ["clients.effective_on >= '#{junk.to_s}'"]
      end 

      @unpaids = @my_apps.where(filter.join(" AND ")).paginate(page: params[:page])
    else
      redirect_to '/signin'
    end
  end
end
