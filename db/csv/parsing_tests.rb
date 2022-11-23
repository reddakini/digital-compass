require "csv"

# ******************* Pathways *******************
# filepath = "./pathways.csv"

# CSV.foreach(filepath, headers: :first_row) do |row|
#   puts "------------------------------------------------------------"
#   pathway = {
#     name: row['pw_name'],
#     category: row['pw_category'],
#     description_short: row['pw_short_desc'],
#     description: row['pw_long_desc'],
#     suit_for: row['pw_suit'],
#     job_roles: row['pw_job_roles'],
#     avg_salary: row['pw_avg_salary'],
#     projected_growth: row['pw_proj_growth']
#   }
#   puts "---------------------------HASHED---------------------------"
#   puts pathway
#   puts "\n"
#   puts "\n"
#   # Pathway.create!(pathway)
# end

# ******************* Courses *******************
filepath = "./courses.csv"
CSV.foreach(filepath, headers: :first_row) do |row|
  course = {
    title: row['co_title'],
    description: row['co_desc'],
    url: row['co_url'],
    rating: row['co_rating'],
    projected_growth: row['co_proj_growth'],
  }
  pathway = row['pathway']

  puts "---------------------------HASHED---------------------------"
  puts 
  puts "\n"
  puts "\n"
  # Pathway.create!(pathway)
end
