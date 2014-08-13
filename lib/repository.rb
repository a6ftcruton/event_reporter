require 'csv'
require_relative 'attendee'

class Repository
  attr_reader :filepath, :attendees

  def initialize(filepath="test_csv.csv")
    @attendees = open_file(filepath)
    #open_file(filepath)
  end

  def open_file(filepath)
    contents = CSV.open(filepath, headers: true, header_converters: :symbol)
    contents.map { |row| p Attendee.new(row) }

  end

  def find_by(option, criteria)
    attendees.map do |attendee|
      attendee.send(:option) == criteria
    end
  end

end
