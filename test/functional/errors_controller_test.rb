require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase

  test "should return not_found status for json" do
    get :not_found, :format => :json

    assert_response :not_found
    body = MultiJson.load(response.body, :symbolize_keys => true)
    assert_equal "Not Found", body[:message]
  end

  test "should return not_found status for html" do
    get :not_found, :format => :html

    assert_response :not_found
    refute_empty response.body
  end

  test "should return internal_error status for html" do
    get :internal_error, :format => :html

    assert_response :internal_server_error
    refute_empty response.body
  end

  test "should return internal_error status for json" do
    get :internal_error, :format => :json

    assert_response :internal_server_error
    body = MultiJson.load(response.body, :symbolize_keys => true)
    assert_equal "Internal Server Error", body[:message]
  end

  test "should return unprocessable_entity status for html" do
    get :unprocessable_entity, :format => :html

    assert_response :unprocessable_entity
    refute_empty response.body
  end

  test "should return unprocessable_entity status for json" do
    get :unprocessable_entity, :format => :json

    assert_response :unprocessable_entity
    body = MultiJson.load(response.body, :symbolize_keys => true)
    assert_equal "Unprocessable Entity", body[:message]
  end
end
