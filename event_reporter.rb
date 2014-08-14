Dir["./lib/*.rb"].each { |file| require file }

cli = CLI.new
#printer = Printer.new
cli.start
cli.get_user_command
