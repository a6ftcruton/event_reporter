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
    when "load"  then Repository.new
    when "help" then printer.help(input[1], input[2])
    # when 'queue' then puts 'QUEUEING'
    # when 'find'  then puts 'FINDING'
    # when 'q'    then exit
    else
      printer.help_instructions
    end
    get_user_command
  end


  # input = gets.downcase.split(" ")
  # command = input[0]
  # option  = input[1]
  # criteria = input[2]
  #
  # case input[0]
  # when queue
  #   queue(option, criteria)
  # when load
  #   load(option, criteria="")
  # when find
  #   find(option)
  # else
  #   printer.help_instructions


  # begin loop
    # load <filename> => ['load', 'filename']
    # get users command (count, clear print, blah blah)
    # get options for command (filename, save_to_filename)
    # do the thing with the options
end






# ------
# repository.find_by(attribute, user_input)
