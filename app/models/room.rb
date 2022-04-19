class Room
  class CapacityReachedError < RuntimeError; end
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @capacity = attributes[:capacity] # integer
    @patients = [] # an arry of Patient INSTANCES
  end

  def full?
    @patients.length >= @capacity
  end

  # self.add_patient
  # vip.add_patient(tirso)
  def add_patient(patient) # patient is an INSTANCE
    if full?
      raise CapacityReachedError, 'The room is full'
    else
      @patients << patient # giving patient to room
      patient.room = self # give room to patient
      # self is the room!
    end
  end
end
