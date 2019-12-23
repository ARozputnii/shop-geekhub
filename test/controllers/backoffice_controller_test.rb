require 'test_helper'

class BackofficeControllerTest < ActionDispatch::IntegrationTest
  test 'should get Categories' do
    get backoffice_Categories_url
    assert_response :success
  end
end
