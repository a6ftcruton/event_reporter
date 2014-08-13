require 'csv'
require_relative 'printer'
require_relative 'attendee'

class Repository
  attr_reader :filepath, :attendees

  def initialize(filepath="test_csv.csv")
    @attendees = open_file(filepath)
    #open_file(filepath)
  end

  def open_file(filepath)
    contents = CSV.open(filepath, headers: true, header_converters: :symbol)
    contents.map { |row| Attendee.new(row) }

  end

  def find_by(option, criteria)
    attendees.select do |attendee|
      p attendee if attendee.send(option.to_sym) == criteria
    end
  end

end
