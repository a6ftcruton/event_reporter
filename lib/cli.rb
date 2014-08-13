require 'pry'
require_relative 'printer'
require_relative 'repository'

class CLI

  attr_reader :printer, :load

  def initialize
    @printer         = Printer.new
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
    when "load" then Repository.new
    when "help" then printer.help(input[1], input[2])
    # when 'queue' then puts 'QUEUEING'
    when 'find'  then Repository.new.find_by(option, criteria)
    # when 'q'    then exit
    else
      printer.help_instructions
    end
    get_user_command
  end
end






# ------
# repository.find_by(attribute, user_input)
