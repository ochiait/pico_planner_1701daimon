require 'test_helper'

class PlanItemsControllerTest < ActionController::TestCase

  test "template index" do
    m =  FactoryGirl.create(:user)
    session[:user_id] = m.id
    get :index
    assert_response :ok
  end

  # 要確認
  # test "Forbidden index" do
  #   m =  FactoryGirl.create(:user)
  #   get :index
  #   assert_response :forbidden
  # end
end
