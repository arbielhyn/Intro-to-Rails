# lib/tasks/import_libraries.rake
require 'csv'

namespace :import do
  desc "Import libraries from CSV file"
  task libraries: :environment do
    csv_file_path = Rails.root.join('db', 'seeds', 'library.csv')

    CSV.foreach(csv_file_path, headers: true) do |row|
      recreation_complex_name = row['recreation_complex_name']
      recreation_complex = RecreationComplex.find_by(name: recreation_complex_name)

      if recreation_complex
        Library.create(
          name: row['name'],
          address: row['address'],
          notes: row['notes'],
          website: row['website'],
          recreation_complex: recreation_complex
        )
      else
        puts "Recreation Complex not found for library: #{recreation_complex_name}"
      end
    end
  end
end
