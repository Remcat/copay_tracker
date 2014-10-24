class VisitorsController < ApplicationController

  def index 
    @unpaids = Appointment.where(copay_received: false)
  end

end
