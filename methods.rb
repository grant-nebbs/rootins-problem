class Driver
  @milesDriven = 0
  @avgSpeed = 0

  def initialize(name)
    @name = name
  end

  def trip(avgSpeed, distance)
    @milesDriven = distance
    @avgSpeed = avgSpeed
  end
end

drivers = Array.new

def timeToHours(time)
  splitTime = time.split(':', 1)
  hours = ratiosplitTime[0] + '.' + (splitTime[1].to_i / 60)
  return hours.to_i
end

def findDriver(name)
  for driver in drivers
    if driver.name === name
      return driver
    end
  end
  print("Name not found in drivers")
end

def getAvgSpeed(startT, endT, distance)
  numOfHours = timeToHours(endT) - timeToHours(startT)
  return distance/numOfHours
end

def processLine(line)
  lineArray = line.split
  command = lineArray[0]
  if(command === "Driver")
    drivers.push(Driver.new(lineArray[1]))
  else if(command === "Trip")
    driver = findDriver(lineArray[1])
    driver.trip(getAvgSpeed(lineArray[2], lineArray[3], lineArray[4]), lineArray[4])
  else 
    print("Incorrect formatting of line")
  end
end

def printOutput
  for driver in drivers
    if driver.avgSpeed < 100 && driver.avgSpeed > 5
      puts(driver.name + ": " + driver.distance + " miles @ " + driver.avgSpeed + " mph")
    else
      puts(driver.name + ": 0 miles"
    end
  end
end
