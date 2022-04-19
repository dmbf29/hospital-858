require_relative 'app/models/patient'
require_relative 'app/models/room'
require_relative 'app/repositories/patient_repository'

tirso = Patient.new(name: 'tirso')
nana = Patient.new(name: 'nana')
james = Patient.new(name: 'james')
chris = Patient.new(name: 'chris')

vip = Room.new(capacity: 2)
standard = Room.new(capacity: 20)

# p vip
# p tirso
# vip.add_patient(tirso)
# p tirso
# p vip

# p tirso.room.id



# vip.add_patient(nana)
# standard.add_patient(james)

# p vip
# tirso.room = vip

# # p standard
csv_file_path = 'data/rooms.csv'
room_repository = RoomRepository.new(csv_file_path)

csv_file_path = 'data/patients.csv'
patient_repository = PatientRepository.new(csv_file_path, room_repository)

# p patient_repository
# patient_repository.add_patient(chris)
# p chris
