require 'minitest_helper'
require 'tmpdir'

class TestMotd < Minitest::Test
  def test_somethin
    assert_equal File.open('motd_expected', 'r').read, `cat motd_rss_example.xml | ruby motd.rb`
  end
end
