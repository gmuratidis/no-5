# frozen_string_literal: true

class Place < CommandBase
  scope :robot

  class << self
    private

    def execute(x, y, direction, robot:) # rubocop:disable Naming/MethodParameterName
      robot.place x, y, direction
    end
  end
end
