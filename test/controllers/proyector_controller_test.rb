require 'test_helper'

class ProyectorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get proyector_index_url
    assert_response :success
  end

end
