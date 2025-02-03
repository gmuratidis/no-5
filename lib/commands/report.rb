# frozen_string_literal: true

class Report < CommandBase
  scope :robot, :stdout

  class << self
    private

    def execute(robot:, stdout:)
      stdout.puts robot.report
    end
  end
end
