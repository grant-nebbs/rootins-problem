require_relative "methods.rb"

# Read in file from command line
file_name = ARGV[0]
file = File.open(file_name)
# Array for keeping drivers
drivers = Array.new

# Checks existence of file
if(file.exist?)
  # Splits file into array of the lines in file
  file_data = file.readlines.map(&:chomp)

  # Processes each line according to their commands
  for line in file_data
    processLine(line, drivers)
  end

  # Generates and produces output from processed lines
  printOutput(drivers)
else
  # Notifies user if file is not found
  puts("File does not exist in current directory")
end
