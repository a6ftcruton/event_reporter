require 'pry'
require_relative 'printer'
require_relative 'repository'

class CLI

  attr_reader :printer, :load, :repository, :queue

  def initialize
    @printer         = Printer.new
    @queue           = []
    # @repository    = Repository.new
  end

  def start
    printer.greet_user
  end

  def get_user_command
    printer.prompt_for_input
    input = gets.downcase.split(" ")
    command = input[0]
    option  = input[1]
    criteria = input[2]
    case command
    when "load"
      @repository = Repository.new
    when "help" then printer.help(input[1], input[2])
    # when 'queue' then puts 'QUEUEING'
    when 'find'
      if repository.nil?
        printer.load_error_message
      elsif criteria.nil?
        printer.help_instructions
      else
      repository.find_by(option, criteria)
      end
    end
    get_user_command
  end
end

#when user enters 'find'
#if repository not exist, print msg

# queue.sort_by { |attendee| attendee.send(option.to_sym) }

# ------
# repository.find_by(attribute, user_input)
