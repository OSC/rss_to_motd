require 'minitest_helper'
require 'tmpdir'

class TestMotd < Minitest::Test
  def test_somethin
    assert_equal File.open('test/fixtures/motd_expected', 'r').read, `cat test/fixtures/motd_rss_example.xml | ruby motd.rb`
  end
end
