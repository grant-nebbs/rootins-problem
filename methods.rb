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


def timeToHours(time)
  splitTime = time.split(':', 1)
  hours = ratiosplitTime[0] + '.' + (splitTime[1].to_i / 60)
  return hours.to_i
end


def getAvgSpeed(startT, endT, distance)
  numOfHours = timeToHours(endT) - timeToHours(startT)
  return distance/numOfHours
end

def processLine(line)
  lineArray = line.split
  command = lineArray[0]
  if(command === "Driver")
    return Driver.new(lineArray{1]
  else if(command === "Trip")
    
  else 
    print("Incorrect formatting of line")
  end
end
