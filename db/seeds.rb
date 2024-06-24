# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
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
fitness_center_file = 'db/seeds/fitness_center.csv'

# Parse CSV data
recreation_complex_data = parse_csv_data(recreation_complex_file)
library_data = parse_csv_data(library_file)
fitness_center_data = parse_csv_data(fitness_center_file)
puts "Recreation Complexes count: #{recreation_complex_data.size}"
puts "Libraries count: #{library_data.size}"
puts "Fitness Centers count: #{fitness_center_data.size}"
# Create Recreation Complexes
recreation_complex_data.each do |row|
  complex = RecreationComplex.create(
    name: row['Complex Name'],
    address: row['Address'],
  )

  # Create Libraries associated with this Recreation Complex
  associated_libraries = library_data.select { |lib| lib['Complex ID'] == complex.complex_id }
  associated_libraries.each do |lib_row|
    Library.create(
      name: lib_row['Name'],
      address: lib_row['Address'],
      notes: lib_row['Notes'],
      website: lib_row['Website'],
      recreation_complex: complex
    )
  end

  # Create Fitness Centers associated with this Recreation Complex
  associated_fitness_centers = fitness_center_data.select { |fit| fit['Complex ID'] == complex.complex_id }
  associated_fitness_centers.each do |fit_row|
    FitnessCenter.create(
      name: fit_row['Name'],
      address: fit_row['Address'],
      notes: fit_row['Notes'],
      website: fit_row['Website'],
      recreation_complex: complex
    )
  end

end
