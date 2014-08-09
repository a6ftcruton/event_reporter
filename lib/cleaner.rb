class Cleaner

  def zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

  def phone_number(number)
    if number
      number = number.scan(/[0-9]/).join
      if number.length == 11 && number.start_with?("1")
        number = number[1..-1]
      end
      if number.length != 10
        number = "0000000000"
      end

    return number
    end
  end

end
