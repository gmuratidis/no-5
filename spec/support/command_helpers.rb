def command_list
  ObjectSpace.each_object(CommandBase.singleton_class)
             .filter_map { |klass| klass.name.upcase unless klass == CommandBase }
end
