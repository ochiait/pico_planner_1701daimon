require "rails_helper"
describe PlanItemsController do
  describe '#create success' do
    example "template index" do
      m =  FactoryGirl.create(:user)
      session[:user_id] = m.id
      get :index
      expect(response).to have_http_status 200
    end
    example "Forbidden index" do
      m =  FactoryGirl.create(:user)
      expect {
      	get :index
      }.to raise_error(ApplicationController::Forbidden)
    end
  end
end
