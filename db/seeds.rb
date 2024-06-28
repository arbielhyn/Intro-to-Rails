require 'csv'

# Clear existing data
RecreationComplex.destroy_all
Library.destroy_all
FitnessCenter.destroy_all

# Function to parse CSV data from file
def parse_csv_data(file_path)
  CSV.read(file_path, headers: true)
end

# File paths for the datasets
recreation_complex_file = 'db/seeds/recreation_complex.csv'
library_file = 'db/seeds/library.csv'

# Parse CSV data
recreation_complex_data = parse_csv_data(recreation_complex_file)
library_data = parse_csv_data(library_file)

puts "Recreation Complexes count: #{recreation_complex_data.size}"
puts "Libraries count: #{library_data.size}"

# Create Recreation Complexes
recreation_complexes = {}
recreation_complex_data.each do |row|
  recreation_complexes[row['Complex Name']] = RecreationComplex.create!(
    name: row['Complex Name'],
    address: row['Address']
  )
end

# Create Libraries
library_data.each do |lib_row|
    Library.create!(
      name: lib_row['Name'],
      address: lib_row['Address'],
      notes: lib_row['Notes'],
      website: lib_row['Website'],
    )

end
