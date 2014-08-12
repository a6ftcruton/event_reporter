class Printer

  def greet_user
    puts "Greetings!"
  end

  def prompt_for_input
    puts "Enter your command: "
  end

  def help(command="help_instructions", option="")
    case command
    when "help_instructions" then help_instructions
    when "load"  then load_csv
    when "queue" then queue(option)
    when "find"  then find(option)
    else
      "Nothing"
    end
  end

  def help_instructions
    puts "These are the commands you may enter: "
    puts "\thelp"
    puts "\tload"
    puts "\tqueue"
    puts "\tfind"
  end

  def load_csv
    "Erases any loaded data and parses the specified file. "
  end

  def queue(option)
    case option
    when "count"    then "Outputs number of records in current queue."
    when "clear"    then "Empties the queue."
    when "print"    then "Prints out a tab-delimited table with a header row."
    when "print by" then "Prints the data table sorted by the specified attribute."
    when "save to"  then "Exports the current queue to the specified filename as a CSV."
    else
      "Here are the following options to queue: queue count, queue clear, queue print, queue print by, queue save to"
    end
  end

  def find(option)
    "Loads the queue with all the records matching the criteria for the given attribute."
  end


end
