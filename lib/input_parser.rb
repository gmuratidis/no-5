# frozen_string_literal: true

class InputParser
  COMMAND_STRING_PATTERN = /(\w+)(\s.+)?/
  WHITESPACE_PATTERN = /\s/

  private_constant :COMMAND_STRING_PATTERN, :WHITESPACE_PATTERN

  class << self
    def parse(input)
      return nil if blank? input

      command, *args = explode input

      raise InvalidCommandError, I18n.t('errors.invalid_command', input:) unless commands.key? command

      [commands[command], args]
    end

    private

    def commands
      @commands ||= ObjectSpace.each_object(CommandBase.singleton_class)
                               .reject { |klass| klass == CommandBase }
                               .each_with_object({}) do |klass, memo|
                                 memo[klass.name.upcase] = klass
                               end
    end

    def explode(input)
      command, rest = input.upcase.match(COMMAND_STRING_PATTERN)&.captures

      [command, *extract_args(rest)]
    end

    def extract_args(input)
      return [] if blank? input

      input.gsub(WHITESPACE_PATTERN, '').split(',').collect do |arg|
        int_arg = arg.to_i

        int_arg.to_s == arg ? int_arg : arg
      end
    end

    def blank?(input)
      input.nil? || input.empty?
    end
  end
end
