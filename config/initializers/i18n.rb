# frozen_string_literal: true

require 'I18n'

I18n.load_path += Dir["#{__dir__}/../locales/**/*.yml"]

I18n.default_locale = :en
