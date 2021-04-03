# Class to keep info about drivers
class Driver

  attr_accessor :name, :milesDriven, :avgSpeed, :numTrips, :timeTaken

  def initialize(name)
    @name = name
    @milesDriven = Array.new
    @timeTaken = Array.new
    @avgSpeed = Array.new
    @numTrips = 0
  end
end

# Handles format of input time and returns ratio of hours
def timeToHours(time)
  if time.length > 5 || time[2] != ':'
    raise "Incorrect format of time"
  end
  splitTime = time.chars
  hours = splitTime[0].to_i * 10 + splitTime[1].to_i
  partialHours = (splitTime[3].to_i * 10 + splitTime[4].to_i) / 60.0
  newTime = hours + partialHours
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
    raise "Name not found in drivers"
  end
  return d
end

# Calculates averge speed from input data
def getAvgSpeed(startT, endT, distance)
  numOfHours = timeToHours(endT) - timeToHours(startT)
  if numOfHours === 0
    avgSpeed = 0
  elsif
    avgSpeed = (distance.to_f)/numOfHours
  end
  return avgSpeed, numOfHours
end

# Method for processing a line by command
def processLines(lines, drivers)
  for line in lines
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
        speed, time = getAvgSpeed(lineArray[2], lineArray[3], lineArray[4])
        driver.avgSpeed << speed
        driver.milesDriven << lineArray[4].to_f
        driver.timeTaken << time
        driver.numTrips += 1 
      end
    else 
      # Notifies user of incorrect formatting of file
      print("Incorrect formatting of line")
    end
  end
  return drivers
end

# Prints output for each driver
def printOutput(drivers)
  for driver in drivers.sort_by {|driver| driver.milesDriven.sum}.reverse
    avgSpeed = 0
    tripTracker = 0
    if driver.numTrips > 0
      for avg in driver.avgSpeed
        avgSpeed += (avg * (driver.timeTaken[tripTracker] / driver.timeTaken.sum))
        tripTracker += 1
      end
    end

    if avgSpeed < 100 && avgSpeed > 5
      puts(driver.name + ": " + driver.milesDriven.sum.round().to_s + " miles @ " + avgSpeed.round().to_s + " mph")
    else
      puts(driver.name + ": 0 miles")
    end
  end
  return nil
end
