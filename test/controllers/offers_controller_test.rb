require 'test_helper'

class OffersControllerTest < ActionDispatch::IntegrationTest
  test "should get listAll" do
    get offers_listAll_url
    assert_response :success
  end

end
