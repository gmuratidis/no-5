# frozen_string_literal: true

class Place < CommandBase
  scope :robot

  class << self
    private

    def execute(x, y, direction, robot:) # rubocop:disable Naming/MethodParameterName
      robot.place x, y, direction
    end

    def validate(*args)
      raise ValidationError, I18n.t('errors.argument_count') if args.length != 3

      x, y, direction = args

      validate_coordinate x, :x
      validate_coordinate y, :y

      true
    end

    def validate_coordinate(coordinate, arg)
      return true if coordinate.is_a?(Integer) and coordinate >= 0

      raise ValidationError, I18n.t('errors.not_an_integer', arg:)
    end
  end
end
