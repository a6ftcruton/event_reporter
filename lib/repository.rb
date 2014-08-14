require 'pry'
require 'csv'
require 'terminal-table'

class Repository
  attr_reader :filepath, :attendees, :queue, :cli

  def initialize(filepath="event_attendees.csv")
    @attendees = open_file(filepath)
  end

  def open_file(filepath)
    @contents = CSV.open(filepath, headers: true, header_converters: :symbol)
    build_attendee_by_row
  end

  def build_attendee_by_row
    @contents.map { |row| Attendee.new(row) }
  end

  def find_by(option, criteria)
    attendees.select do |attendee|
      attendee.send(option.to_sym).downcase == criteria.downcase
    end
  end
end
