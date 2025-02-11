# frozen_string_literal: true

require_relative 'command_parser'

class Application
  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
  end

  def start
    @stdout.puts 'Please enter a command:'
    command_parser = CommandParser.new(@stdin.gets.chomp, @stdout)
    # puts 'Success'
  end

  private

  attr_reader :stdin, :stdout

  private_class_method :new

  class << self
    def start(...)
      new(...).start
    end
  end
end
