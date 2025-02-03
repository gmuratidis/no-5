# frozen_string_literal: true

class CommandBase
  class << self
    def run(*, **context)
      validate(*) and execute(*, **context.slice(*registered_scopes))
    end

    private

    def execute(...)
      raise NotImplementedError, I18n.t(
        'errors.not_implemented',
        klass: name,
        method: '.execute'
      )
    end

    def registered_scopes
      @registered_scopes ||= []
    end

    def scope(*scopes)
      registered_scopes.replace registered_scopes | scopes
    end

    def validate(*)
      true
    end
  end
end
