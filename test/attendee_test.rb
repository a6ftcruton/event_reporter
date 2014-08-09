require 'minitest/autorun'

class AttendeeTest < MiniTest::Unit::TestCase

  def test_it_exists
    attendee = Attendee.new
    assert_kind_of Attendee, attendee
  end
end
