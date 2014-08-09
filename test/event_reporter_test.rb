require 'minitest/autorun'
require_relative '../event_reporter'

class EventReporterTest < MiniTest::Unit::TestCase

  def test_it_exists
    er = EventReporter.new
    assert_kind_of EventReporter, er
  end
end
