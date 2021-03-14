# Class to keep info about drivers
class Driver

  attr_accessor :name, :milesDriven, :avgSpeed, :numTrips

  def initialize(name)
    @name = name
    @milesDriven = 0
    @avgSpeed = Array.new
    @numTrips = 0
  end
end

# Handles format of input time and returns ratio of hours
def timeToHours(time)
  splitTime = time.split(':', 1)
  hours = splitTime[0] + '.' + (splitTime[1].to_i / 60).to_s
  newTime = hours.to_i
  return newTime
end

# Finds driver by name to check for existence
def findDriver(name, drivers)
  d = nil
  for driver in drivers
    if driver.name === name
      d = driver
      break
    end
  end
  if d.nil?
    print("Name not found in drivers")
  end
  return d
end

# Calculates averge speed from input data
def getAvgSpeed(startT, endT, distance)
  numOfHours = timeToHours(endT) - timeToHours(startT)
  if numOfHours === 0
    avgSpeed = 0
  elsif
    avgSpeed = (distance.to_i)/numOfHours
  end
  return avgSpeed
end

# Method for processing a line by command
def processLine(line, drivers)
  # Break apart line for evaluation
  lineArray = line.split
  command = lineArray[0]

  # Checks command
  if(command === "Driver")
    # Add new driver to array
    drivers.push(Driver.new(lineArray[1]))
  elsif(command === "Trip")
    # Adds new trip to respective driver
    driver = findDriver(lineArray[1], drivers)
    if !driver.nil? && lineArray[2] != lineArray[3] && !lineArray[4].nil?
      speed = driver.avgSpeed
      speed.push(getAvgSpeed(lineArray[2], lineArray[3], lineArray[4]))
      driver.avgSpeed = speed
      driver.milesDriven = lineArray[4].to_i + driver.milesDriven
      driver.numTrips = 1 + driver.numTrips
    end
  else 
    # Notifies user of incorrect formatting of file
    print("Incorrect formatting of line")
  end
  return nil
end

# Prints output for each driver
def printOutput(drivers)
  for driver in drivers
    if driver.numTrips > 0
      avgSpeed = driver.avgSpeed.sum / driver.numTrips
    else
      avgSpeed = 0
    end

    if avgSpeed < 100 && avgSpeed > 5
      puts(driver.name + ": " + driver.milesDriven.to_s + " miles @ " + avgSpeed.to_s + " mph")
    else
      puts(driver.name + ": 0 miles")
    end
  end
  return nil
end
