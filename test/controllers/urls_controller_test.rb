require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest

  test "can render error when create url" do
    URL = 'soft-project.com/rnd_department/testing_task'
    post urls_url, params: { full: URL }
    assert_response 400, "response should be bad request"
  end

  test "can return not found for short url" do
    NO_EXIST_SORT = "no_exist"
    get url_url(short_url: NO_EXIST_SORT)
    assert_response :missing, "should return: not found"
  end

end
