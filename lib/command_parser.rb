# frozen_string_literal: true

class CommandParser
  def initialize(input_string)
    @input_string = input_string.downcase

    case
    when @input_string.include?('place')
      place
    when @input_string.include?('move')
      move
    when @input_string.include?('left')
      left
    when @input_string.include?('right')
      right
    when @input_string.include?('help')
      help
    when @input_string.include?('report')
      report
    when @input_string.include?('exit')
      exit
    else
      puts "Invalid command, nust be place, move, left, right, help, report or exit"
    end
  end

  private

  def place
    if @input_string.match?(/^place\s+(\d+),\s*(\d+),\s*(north|east|west|south)$/i)
      # process the place command
      # @input_string
    else
      puts "Invalid command format. Correct format: 'place X,Y,F' where X and Y are integers and F is one of north, east, west, south."
      nil
    end
  end

  def move
    # Stub for MOVE command
  end

  def left
    # Stub for LEFT command
  end

  def right
    # Stub for RIGHT command
  end

  def help
    # Stub for HELP command
  end

  def report
    # Stub for REPORT command
  end

  def exit
    # Stub for REPORT command
  end
end

