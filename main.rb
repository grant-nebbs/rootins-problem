require_relative "methods.rb"

# Read in file from command line
file_name = ARGV[0]
# Array for keeping drivers
drivers = Array.new

# Checks existence of file
if(!file_name.nil? && File.exist?(file_name))
  # Open file
  file = File.open(file_name)

  # Splits file into array of the lines in file
  file_data = file.readlines.map(&:chomp)

  # Processes each line according to their commands
  drivers = processLines(file_data, drivers)

  # Generates and produces output from processed lines
  printOutput(drivers)
else
  # Notifies user if file is not found
  puts("File does not exist in current directory")
end
