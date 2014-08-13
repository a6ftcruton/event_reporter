require 'minitest/autorun'
require_relative '../lib/repository'


class LoadTest < Minitest::Test
  def test_it_exists
    repo = Repository.new
    assert repo.exist?("../test_csv.csv")

    repo = Repository.new
    refute repo.exist?("blahblahblah.csv")
  end
end
