require 'test_helper'

class UrlTest < ActiveSupport::TestCase

  MAX_URL = 1024
  LONG_URL = "https://some.domen/#{"t"*MAX_URL}"
  VALID_URL = "https://vlidate.full.url"
  
  test "vlidate full url" do
    assert Url.build(VALID_URL).valid?, "Not validate url"
  end

  test "without http" do
    assert_not Url.build("vlidate.full.url").valid?, "it should be no validate error"
  end

  test "too long url" do
    assert_not Url.build(LONG_URL).valid?, "it should be long url error"
  end

end
