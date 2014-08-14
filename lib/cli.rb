require 'pry'

class CLI
  attr_reader :printer, :load, :repository, :queue

  def initialize
    @printer      = Printer.new
    @queue        = []
  end

  def start
    printer.greet_user
  end

  def get_user_command
    printer.prompt_for_input
    input           = gets.downcase.gsub(/to | by /, "").split(" ")
    command         = input[0]
    option          = input[1]
    criteria        = input[2]
    #criteria_helper = input[3]
    case command
    when "load"
      printer.load_message
      @repository = Repository.new
    when "help" then printer.help(input[1], input[2])
    when 'find'
      if repository.nil?
        printer.load_error_message          # <= make this its own method
      elsif criteria.nil?
        printer.help_instructions
      else
        @queue << repository.find_by(option, criteria) # <= helper method
      end
    when 'queue' then queue_interaction(option, criteria)
    end
    get_user_command
  end


  def queue_interaction(option, criteria)
    case option
    when "count" then count_queue
    when "clear" then clear_queue
    when "print" then print_queue
    when "save"  then save_queue(criteria)
    end
  end

  def count_queue
    p queue.count
  end

  def clear_queue
    @queue = []
  end

  def save_queue(criteria)
    CSV.open(criteria, "wb") do |csv|
      csv << print_queue
    end
  end

  def print_queue
    separate_attendees_by_row
  end

  def separate_attendees_by_row
    queue = @queue.flatten
    printer.table_header
    printer.format_attendee_table(queue)
  end
end
