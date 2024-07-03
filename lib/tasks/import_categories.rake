# lib/tasks/import_categories.rake

require 'csv'

desc 'Import categories from CSV'
task import_categories: :environment do
  # File path for the dataset
  categories_file = 'db/seeds/categories.csv'

  # Clear existing data (optional, depending on your needs)
  Category.destroy_all

  # Function to parse CSV data from file
  def parse_csv_data(file_path)
    CSV.read(file_path, headers: true)
  end

  # Parse CSV data
  categories_data = parse_csv_data(categories_file)

  # Create Categories
  categories_data.each do |row|
    Category.create!(
      id: row['id'].to_i,
      name: row['name']
    )
  end

  puts "Categories imported successfully!"
end
