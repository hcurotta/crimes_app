require 'csv'

desc "Import teams from csv file"
task :import => [:environment] do

  file = "public/Crimes_-_2001_to_present.csv"

  CSV.foreach(file, :headers => true) do |row|
    c=Crime.new
    puts row[2]
      c.date= Date.parse(row[2])
      c.block=row[3]
      c.crime_type=row[5]
      c.description = row[6]
      c.location_type = row[7]
      c.latitude = row[17]
      c.longitude = row[18]
      c.save 
  end
end