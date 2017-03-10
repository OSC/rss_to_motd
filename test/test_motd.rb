require 'minitest_helper'
require 'tmpdir'

class TestMotd < Minitest::Test
  def test_somethin
    # assert_equal '/users/PZS0562/efranz/dev/rss', Dir.pwd
    assert_equal `cat motd_rss_example.xml | ruby motd.rb`, File.open('motd_expected', 'r').read
  end
end
