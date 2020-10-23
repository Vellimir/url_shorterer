require 'test_helper'

class UrlFlowTest < ActionDispatch::IntegrationTest

  test "can create an short url" do
    # as user of system 
    # I want to get short url for my long url
    URL = 'https://soft-project.com/rnd_department/testing_task'
    post "/urls", params: { url: URL }
    short = @response.body

    # I want to resolve my short url and get my source url
    get "/urls/#{short}"
    actual = @response.body

    assert_equal actual, URL
  end

  test "can count requests to resolving of short urls" do
    url = urls(:one)
    assert_difference -> { Url.find(url.id).count }, 2 do
      get "/urls/#{url.short}"
      assert_difference -> { Url.find(url.id).count }, 1 do
        get "/urls/#{url.short}"
      end
    end
  end

end
