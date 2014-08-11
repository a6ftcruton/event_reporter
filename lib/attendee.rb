require_relative 'cleaner'

class Attendee
  attr_accessor :first_name,
                :last_name,
                :email,
                :phone_number,
                :street,
                :city,
                :state,
                :zipcode

  def initialize(input = {})
    cleaner            = Cleaner.new
    @first_name        = cleaner.first_name(input[:first_name])
    @last_name         = cleaner.last_name(input[:last_name])
    @email             = input[:email]
    @phone_number      = cleaner.phone_number(input[:phone_number])
    @street            = cleaner.street(input[:street])
    @city              = cleaner.city(input[:city])
    @state             = cleaner.state(input[:state])
    @zipcode           = cleaner.zipcode(input[:zipcode])
  end
end
