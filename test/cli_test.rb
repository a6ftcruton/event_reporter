require 'test/unit'
require 'flexmock/test_unit'

class TestCLI < Test::Unit::TestCase

  def test_user_can_quit_at_any_time
    quit_input = flexmock(:quit => "Thank you.")
    assert_equal "Thank you.", quit_input.quit
  end
end
