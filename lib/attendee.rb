require_relative 'cleaner'

class Attendee
  include Cleaner
  attr_accessor :first_name,
                :last_name,
                :email,
                :phone_number,
                :street,
                :city,
                :state,
                :zipcode

  def initialize(input = {})
    #cleaner            = Cleaner.new
    @first_name        = Cleaner.first_name(input[:first_name])
    @last_name         = Cleaner.last_name(input[:last_name])
    @email             = input[:email_address]
    @phone_number      = Cleaner.phone_number(input[:homephone])
    @street            = Cleaner.street(input[:street])
    @city              = Cleaner.city(input[:city])
    @state             = Cleaner.state(input[:state])
    @zipcode           = Cleaner.zipcode(input[:zipcode])
  end
end
