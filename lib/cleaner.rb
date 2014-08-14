class Cleaner
  def first_name(first_name)
    first_name.to_s
  end

  def last_name(last_name)
    last_name.to_s
  end

  def phone_number(number)
    number = number.to_s.scan(/[0-9]/).join
    case
    when number.length == 10 then number
    when number.length > 10  then number[1..10]
    when number.length < 10  then "0000000000"
    else
      number
    end
  end

  def street(street)
    street.to_s
          .split(/\s/)
          .map(&:capitalize)
          .join(" ")
  end

  def city(city)
    city.to_s
        .split(/\s/)
        .map(&:capitalize)
        .join(" ")
  end


  def state(state_code)
    state_code.to_s
  end

  def zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

end
