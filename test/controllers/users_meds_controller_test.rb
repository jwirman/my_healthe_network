require 'test_helper'

class UsersMedsControllerTest < ActionController::TestCase
  setup do
    @users_med = users_meds(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_meds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_med" do
    assert_difference('UsersMed.count') do
      post :create, users_med: { freq: @users_med.freq, freq_unit: @users_med.freq_unit, is_tab: @users_med.is_tab, num_doses: @users_med.num_doses, num_per_dose: @users_med.num_per_dose, start: @users_med.start }
    end

    assert_redirected_to users_med_path(assigns(:users_med))
  end

  test "should show users_med" do
    get :show, id: @users_med
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_med
    assert_response :success
  end

  test "should update users_med" do
    patch :update, id: @users_med, users_med: { freq: @users_med.freq, freq_unit: @users_med.freq_unit, is_tab: @users_med.is_tab, num_doses: @users_med.num_doses, num_per_dose: @users_med.num_per_dose, start: @users_med.start }
    assert_redirected_to users_med_path(assigns(:users_med))
  end

  test "should destroy users_med" do
    assert_difference('UsersMed.count', -1) do
      delete :destroy, id: @users_med
    end

    assert_redirected_to users_meds_path
  end
end
