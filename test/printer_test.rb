require 'minitest/autorun'
require_relative '../lib/printer'

class PrinterTest < Minitest::Test

  def setup
    @printer = Printer.new
  end

  def test_it_presents_command_options_to_user
    assert_equal "These are the commands you may enter: ", @printer.help
  end

  def test_it_accepts_an_optional_attribute
    assert_equal "Load instructions", @printer.help("load")

    assert_equal "Here are the following options to queue: queue count, queue clear, queue print, queue print by, queue save to",
    @printer.help("queue")
  end

  def test_it_prints_command_options
    assert_equal "Outputs number of records in current queue.", @printer.help("queue", "count")
  end

  def test_it_greets_the_user
    assert_equal "Greetings!", printer.greet_user
  end


end
