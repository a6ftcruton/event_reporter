require_relative 'cleaner'
require 'pry'

class Attendee
  attr_accessor :first_name, :last_name, :phone_number, :zipcode

  def initialize(input = {} )
    cleaner             = Cleaner.new
    @first_name         = cleaner.first_name(input[:first_name])
    @last_name          = cleaner.last_name(input[:last_name])
    @phone_number       = cleaner.phone_number(input[:phone_number])
    @zipcode            = cleaner.zipcode(input[:zipcode])
  end
end
