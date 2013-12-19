require 'spec_helper'

describe SiteController do

  before :each do
    @user = sign_in
  end

  describe "GET static pages" do
    it "responds to index" do
      get :index
      expect(response).to be_success
    end

    it "responds to faq" do
      get :faq
      expect(response).to be_success
    end

    it "responds to chart" do
      get :chart
      expect(response).to be_success
    end

    it "responds to network" do
      get :network
      expect(response).to be_success
    end
  end

  describe "GET generate_calendar_events" do
    it 'generates events for calendar' do
      users_med_array_stub = [ double(id: 1, med: 'med',
                                      firstdose_datetime_start: '1:00',
                                      firstdose_datetime_end: '3:00') ]

      @user.stub_chain(:users_meds, :between).and_return users_med_array_stub
      get :generate_calendar_events, format: :json, start: Date.today.beginning_of_month.to_s
      expect(response.content_type).to eq 'application/json'
      expect(response.body).to eq [{id:1, title:'med', start:'1:00', end:'3:00', allDay:false}].to_json
    end
  end




end
