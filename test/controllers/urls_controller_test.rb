require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest

  test "can render error when create url" do
    URL = 'soft-project.com/rnd_department/testing_task'
    post urls_url, params: {full: URL}
    assert_response 400, "response should be bad request"
  end

end
