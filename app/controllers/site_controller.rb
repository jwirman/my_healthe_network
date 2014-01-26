class SiteController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def faq
  end

  def chart
  end

  def network
  end

  # ajax call
  def generate_calendar_events
    date = Date.parse(params[:start]) + 14.days #adding 14 days because fullCalendar start is from the previous month
    start_date = date.beginning_of_month
    end_date = date.end_of_month
    events = []
    current_user.users_meds.between(start_date, end_date).each do |users_med|
      events << users_med.event_data
    end
    render json: events.flatten.to_json
  end

end
