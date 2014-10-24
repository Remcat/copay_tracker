require 'test_helper'

class InsuranceProvidersControllerTest < ActionController::TestCase
  setup do
    @insurance_provider = insurance_providers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insurance_providers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insurance_provider" do
    assert_difference('InsuranceProvider.count') do
      post :create, insurance_provider: {  }
    end

    assert_redirected_to insurance_provider_path(assigns(:insurance_provider))
  end

  test "should show insurance_provider" do
    get :show, id: @insurance_provider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insurance_provider
    assert_response :success
  end

  test "should update insurance_provider" do
    patch :update, id: @insurance_provider, insurance_provider: {  }
    assert_redirected_to insurance_provider_path(assigns(:insurance_provider))
  end

  test "should destroy insurance_provider" do
    assert_difference('InsuranceProvider.count', -1) do
      delete :destroy, id: @insurance_provider
    end

    assert_redirected_to insurance_providers_path
  end
end
