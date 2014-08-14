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
    case command
    when "load"
      printer.load_message
      @repository = Repository.new
    when "help" then printer.help(input[1], input[2])
    when 'find' then validate_find_search(option, criteria)
    when 'queue' then queue_interaction(option, criteria)
    when 'quit' then exit
    when 'q' then exit
    end
    get_user_command
  end

  def queue_interaction(option, criteria)
    case option
    when "count" then count_queue
    when "clear" then clear_queue
    when "save"  then save_queue(criteria)
    when "print" then print_queue
    end
  end

  private

  def count_queue
    p queue.flatten.count
  end

  def clear_queue
    @queue = []
  end

  def save_queue(criteria)
    CSV.open(criteria, "wb") do |csv|
      csv << queue
    end
  end

  def print_queue
    queue = @queue.flatten
    printer.table_header
    printer.format_attendee_table(queue)
  end

  def validate_find_search(option, criteria)
    if repository.nil?
      printer.load_error_message
    elsif criteria.nil?
      printer.help_instructions
    else
      printer.queue_loaded
      @queue << repository.find_by(option, criteria)
    end
  end
end
