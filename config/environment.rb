# frozen_string_literal: true

Dir.glob("#{__dir__}/initializers/**/*").each do |filename|
  require filename if File.file? filename
end
