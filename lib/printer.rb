class Printer
  def greet_user
    puts "\nWelcome to Event Reporter!"
    puts "Enter your command when ready, otherwise type 'help' for more instructions."
  end

  def prompt_for_input
    puts "\nEnter your command: "
  end

  def help(command="help_instructions", option="", criteria="")
    if command.nil?
      help_instructions
    else
      case command
      when "load"  then help_heading(command); load_csv
      when "queue" then help_heading(command); queue(option)
      when "find"  then help_heading(command); find(option)
      else
        help_instructions
      end
    end
  end

  def help_instructions
    puts "\nThese are the commands you may enter: "
    puts "\t* help"
    puts "\t* load"
    puts "\t* queue"
    puts "\t* find"
    puts "\nFor more information, type 'help' followed by a specific command."
    puts "\n\t* e.g. help queue "
    puts "\n\te.g. help queue count "
  end

  def help_heading(command)
    puts "\nHere is some information on the [#{command.upcase}] command: "
  end

  def load_csv
    puts "\tErases any loaded data and parses the specified file. "
  end

  def queue(criteria)
    case criteria
    when "count"    then puts "\t[#{criteria}]: Outputs number of records in current queue."
    when "clear"    then puts "\t[#{criteria}]: Empties the queue."
    when "print"    then puts "\t[#{criteria}]: Prints a tab-delimited table with a header row."
    when "print by" then puts "\t[#{criteria}]: Prints the data table sorted by the specified attribute."
    when "save to"  then puts "\t[#{criteria}]: Exports the current queue to the specified filename as a CSV."
    else
      puts "You may search [help] for information on the following options to queue: "
      puts "\tqueue count, \n\tqueue clear, \n\tqueue print, \n\tqueue print by, \n\tqueue save to"
    end
  end

  def find(option)
    puts "\tLoads the queue with all the records matching the criteria for the given attribute."
  end

  def load_message
    puts "Your file has loaded..."
  end

  def load_error_message
    puts "You must load the file before you can use the find command to search it."
  end

  def table_header
    puts "First \tLast \t\tEmail \t\t\tPhone Number \tStreet \tCity \tState \tZipcode"
  end

  def format_attendee_table(queue)
    queue.each do |attendee|
      puts "#{attendee.first_name}\t#{attendee.last_name}\t#{attendee.email}\t#{attendee.phone_number}\t#{attendee.street}\t#{attendee.city}\t#{attendee.state}\t#{attendee.zipcode}\n\n"
    end
  end
end
