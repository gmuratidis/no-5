# frozen_string_literal: true

class Application
  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout

    @context = {
      robot: nil,
      stdout:,
      table: nil
    }
  end

  def start
    while (input = prompt)
      next unless (command, args = InputParser.parse(input))

      begin
        command.run *args, **context
      rescue ApplicationError => e
        stdout.puts e.message
      end
    end
  end

  private

  attr_reader :context, :stdin, :stdout

  def prompt
    stdout.print "#{I18n.t 'feedback.prompt'} "

    stdin.gets.chomp
  end

  private_class_method :new

  class << self
    def start(...)
      new(...).start
    end
  end
end
