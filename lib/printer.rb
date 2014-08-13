class Printer

  def greet_user
    puts "\nGreetings!"
  end

  def prompt_for_input
    puts "\nEnter your command: "
  end

  def help(command="help_instructions", option="")
    if command.nil?
      help_instructions   # <= refactor into case statement
    else
      case command
      when "help_instructions" then help_instructions # <= necessary?
      when "load"  then help_heading(command); load_csv
      when "queue" then help_heading(command); queue(option)
      when "find"  then help_heading(command); find(option)
      else
        "An input has escaped you!"
      end
    end
  end

  def help_instructions
    puts "\nThese are the commands you may enter: "
    puts "\thelp"
    puts "\tload"
    puts "\tqueue"
    puts "\tfind"
  end

  def help_heading(command)
    puts "\nHere is some information on the [#{command.upcase}] command: "
  end

  def load_csv
    puts "Erases any loaded data and parses the specified file. "
  end

  def queue(option)
    case option
    when "count"    then puts "Outputs number of records in current queue."
    when "clear"    then puts "Empties the queue."
    when "print"    then puts "Prints out a tab-delimited table with a header row."
    when "print by" then puts "Prints the data table sorted by the specified attribute."
    when "save to"  then puts "Exports the current queue to the specified filename as a CSV."
    else
      puts "You may search [help] for more information on the following options to queue: "
      puts "\tqueue count, \n\tqueue clear, \n\tqueue print, \n\tqueue print by, \n\tqueue save to"
    end
  end

  def find(option)
    puts "Loads the queue with all the records matching the criteria for the given attribute."
  end


end
