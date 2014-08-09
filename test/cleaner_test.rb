require 'minitest/autorun'
require_relative '../lib/cleaner'
require_relative '../lib/attendee'

class CleanerTest < MiniTest::Test

    # Phone Number Tests

    def test_it_outputs_only_numbers
      attendee = Attendee.new(:phone_number => "202.444-9382")
      assert_equal "2024449382", attendee.phone_number
    end

    def test_it_removes_leading_one_from_an_eleven_digit_phone_number
      attendee = Attendee.new(:phone_number => "12024449382")
      assert_equal "2024449382", attendee.phone_number
    end

    def test_it_throws_away_phone_numbers_that_are_too_long
      attendee = Attendee.new(:phone_number => "23334445555")
      assert_equal "0000000000", attendee.phone_number
    end

    def test_it_throws_away_phone_numbers_that_are_too_short
      attendee = Attendee.new(:phone_number => "222333444")
      assert_equal "0000000000", attendee.phone_number
    end

    # Zipcode Tests

    def test_it_can_change_zipcodes
      data = {:zipcode => "80202"}
      attendee = Attendee.new(data)
      assert_equal data[:zipcode], attendee.zipcode
      attendee.zipcode = "12345"
      assert_equal "12345", attendee.zipcode
    end

    def test_it_can_normalize_zipcode
      data = {:zipcode => "9802"}
      attendee = Attendee.new(data)
      assert_equal "09802", attendee.zipcode
    end

    def test_it_can_standardize_nil
      data = {:zipcode => nil}
      attendee = Attendee.new(data)
      assert_equal "00000", attendee.zipcode
    end
end
