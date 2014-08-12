class Cleaner

  def first_name(first_name)
    first_name.to_s.downcase.capitalize
  end

  def last_name(last_name)
    last_name.to_s.downcase.capitalize
  end

  def phone_number(number)
    number = number.to_s.scan(/[0-9]/).join
    case
    when number.length > 10 then number[1..10]
    when number.length < 10 then "0000000000"
    else
      number
    end

    #
    # if number
    #   number = number.scan(/[0-9]/).join
    #   if number.length == 11 && number.start_with?("1")
    #     number = number[1..-1]
    #   end
    #   if number.length != 10
    #     number = "0000000000"
    #   end
    #
    # return number
    # end
  end

  def street(street)
    fix_street = street.to_s.split(/\b/)
    fix_street.map do |street|
      street.capitalize!
    end
    fix_street.join
  end

  def city(city)
    fix_city = city.to_s.split(/\b/)
    fix_city.map do |city|
      city.capitalize!
    end
    fix_city.join
  end

  def state(state_code)
    state_code.to_s.upcase
  end

  def zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

end
