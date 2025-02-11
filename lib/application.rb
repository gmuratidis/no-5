# frozen_string_literal: true

class Application
  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
  end

  def start
    while (input = prompt) do
      break if input == 'EXIT'
    end
  end

  private

  attr_reader :stdin, :stdout

  def prompt
    stdout.print I18n.t('feedback.prompt') + ' '

    stdin.gets.chomp
  end

  private_class_method :new

  class << self
    def start(...)
      new(...).start
    end
  end
end
