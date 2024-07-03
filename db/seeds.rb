require 'csv'

# Clear existing data
RecreationComplex.destroy_all
Library.destroy_all
Category.destroy_all  # Clear existing categories as well

# Function to parse CSV data from file
def parse_csv_data(file_path)
  CSV.read(file_path, headers: true)
end

# File paths for the datasets
recreation_complex_file = 'db/seeds/recreation_complex.csv'
library_file = 'db/seeds/library.csv'
category_file = 'db/seeds/categories.csv'  # Adjust the path to your categories CSV file

# Parse CSV data
recreation_complex_data = parse_csv_data(recreation_complex_file)
library_data = parse_csv_data(library_file)
category_data = parse_csv_data(category_file)

puts "Recreation Complexes count: #{recreation_complex_data.size}"
puts "Libraries count: #{library_data.size}"
puts "Categories count: #{category_data.size}"

# Create Recreation Complexes
recreation_complexes = {}
recreation_complex_data.each do |row|
  recreation_complex = RecreationComplex.create!(
    recreation_complex_id: row['Complex ID'].to_i,
    name: row['Complex Name']
  )
  recreation_complexes[recreation_complex.recreation_complex_id] = recreation_complex
end

# Create Categories
categories = {}
category_data.each do |cat_row|
  category = Category.create!(
    name: cat_row['Name']
    # Add any other attributes you have in your Category model
  )
  categories[category.id] = category
end

# Create Libraries
library_data.each do |lib_row|
  complex_id = lib_row['Complex ID'].to_i
  recreation_complex = recreation_complexes[complex_id]
  category_id = lib_row['Category ID'].to_i  # Assuming 'Category ID' exists in library.csv

  if recreation_complex && categories[category_id]
    Library.create!(
      name: lib_row['Name'],
      address: lib_row['Address'],
      notes: lib_row['Notes'],
      website: lib_row['Website'],
      recreation_complex_id: recreation_complex.id,
      category_id: category_id
    )
  else
    puts "Recreation Complex or Category not found for Library: #{lib_row['Name']}"
  end

end
