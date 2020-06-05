require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get appointments_index_url
    assert_response :success
  end

  test "should get new--skip-routes" do
    get appointments_new--skip-routes_url
    assert_response :success
  end

end
