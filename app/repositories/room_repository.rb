require 'csv'

class CutsomerRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @cutsomers = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def add_cutsomer(cutsomer)
    @cutsomers << cutsomer
    cutsomer.id = @next_id
    @next_id += 1
    # save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      p row
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == 'true'
      # give the room id to the room repository to get a room instance back
      row[:room] = @room_repository.find(row[:room_id].to_i)
      # turn the csv info into instances and then push each one into the array
      p cutsomer = Cutsomer.new(row)
      @cutsomers << cutsomer
      puts
    end
    # update our @next_id
    # if @cutsomer.any?
    #   @next_id = @cutsomers.last.id + 1
    # else
    #   @next_id = 1
    # end
    @next_id = @cutsomers.any? ? @cutsomers.last.id + 1 : 1
  end

  def save_csv
    # how can i save the room ID in the CSV?
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'cured', 'room_id']
      @cutsomers.each do |cutsomer|
        csv << [cutsomer.id, cutsomer.name, cutsomer.cured?, cutsomer.room.id]
      end
    end
  end
end
