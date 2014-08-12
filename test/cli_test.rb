require 'minitest/autorun'
require_relative '../lib/cli'

class TestCLI < Minitest::Test

  def test_start_greets_user
    cli = CLI.new
    assert_equal "Greetings!", cli.start
  end

  def test_it_prints_instructions
    cli = CLI.new

  end

  # def test_user_can_quit_at_any_time
  #   quit_input = flexmock(:quit => "Thank you.")
  #   assert_equal "Thank you.", quit_input.quit
  # end

end
