# Class to keep info about drivers
class Driver
  @milesDriven = 0
  @avgSpeed = Array.new

  def initialize(name)
    @name = name
  end

  def trip(avgSpeed, distance)
    @milesDriven += distance
    @avgSpeed.push(avgSpeed)
  end
end

# Array to store all drivers as they are processed
drivers = Array.new

# Handles format of input time and returns ratio of hours
def timeToHours(time)
  splitTime = time.split(':', 1)
  hours = ratiosplitTime[0] + '.' + (splitTime[1].to_i / 60)
  return hours.to_i
end

# Finds driver by name to check for existence
def findDriver(name)
  for driver in drivers
    if driver.name === name
      return driver
    end
  end
  print("Name not found in drivers")
end

# Calculates averge speed from input data
def getAvgSpeed(startT, endT, distance)
  numOfHours = timeToHours(endT) - timeToHours(startT)
  return distance/numOfHours
end

# Method for processing a line by command
def processLine(line)
  # Break apart line for evaluation
  lineArray = line.split
  command = lineArray[0]

  # Checks command
  if(command === "Driver")
    # Add new driver to array
    drivers.push(Driver.new(lineArray[1]))
  else if(command === "Trip")
    # Adds new trip to respective driver
    driver = findDriver(lineArray[1])
    driver.trip(getAvgSpeed(lineArray[2], lineArray[3], lineArray[4]), lineArray[4])
  else 
    # Notifies user of incorrect formatting of file
    print("Incorrect formatting of line")
  end
end

# Prints output for each driver
def printOutput
  for driver in drivers
    avgSpeed = driver.avgSpeed.sum / driver.avgSpeed.size
    if avgSpeed < 100 && avgSpeed > 5
      puts(driver.name + ": " + driver.distance + " miles @ " + avgSpeed + " mph")
    else
      puts(driver.name + ": 0 miles"
    end
  end
end
