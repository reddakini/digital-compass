require "csv"

filepath = "./pathways.csv"

CSV.foreach(filepath, headers: :first_row) do |row|
  puts "------------------------------------------------------------"
  puts "#{row['pw_name']} (#{row['pw_category']})"
  puts "Desc(short): #{row['pw_short_desc']}"
  puts "Desc(long): #{row['pw_long_desc']}"
  pathway = {
    name: row['pw_name'],
    description: row['pw_long_desc']
  }
  puts "---------------------------HASHED---------------------------"
  puts pathway
  # hash pathway { description: "has \n inside the strings" }
  # WILL THIS BE A PROBLEM?????????????????????????????????????
  puts "\n"
  puts "\n"
  # Pathway.create!(pathway)
end
