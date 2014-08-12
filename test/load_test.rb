require 'minitest/autorun'
require_relative '../lib/load'


class LoadTest < Minitest::Test

  def test_it_exists
    loader = Load.new("../test_csv.csv")
    assert loader.exist?("../test_csv.csv")
  end

  def test_it_loads_default_file_when_given_no_arguments

  end

  def test_it_erases_any_loaded_data

  end

  def test_it_parses_the_specified_file

  end
end
