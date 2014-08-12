require 'csv'
require_relative 'attendee'

class Repository
  attr_reader :filepath, :attendees

  def initialize(filepath="test_csv.csv")
    @attendees = open_file(filepath)
  end

  private

  def open_file(filepath)
    contents = CSV.open(filepath, headers: true, header_converters: :symbol)
    contents.map { |row| Attendee.new(row) }
  end

  def find_by(attribute, user_input)
    attendees.map do |attendee|
      attendee.send(:attribute) == user_input
    end
  end

end
