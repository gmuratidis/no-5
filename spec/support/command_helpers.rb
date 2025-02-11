# frozen_string_literal: true

def command_list
  ObjectSpace.each_object(CommandBase.singleton_class)
             .filter_map { |klass| klass.name unless klass == CommandBase }
end
