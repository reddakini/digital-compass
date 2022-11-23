# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require "csv"

# ******************* Clearing *******************
# check ordering with TAs!!!!!
UserAnswer.destroy_all
RecommendedCourse.destroy_all
Recommendation.destroy_all
User.destroy_all
Course.destroy_all
Assessment.destroy_all
Pathway.destroy_all

# ******************* Users *******************
puts "------------------------------------------------------------------------"
puts "Seeding users..."
5.times do |i|
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "email#{i + 1}@gmail.com",
    password: "123456"
  )
  user.save!
  puts "#{user.first_name} #{user.last_name}"
  puts "#{user.email} / pw: #{user.password} seeded!"
  puts "------------------------------------"
end
puts "5 users seeded!"

# ******************* Pathways *******************
puts "------------------------------------------------------------------------"
filepath = "db/csv/pathways.csv"
CSV.foreach(filepath, headers: :first_row) do |row|
  pathway = {
    name: row['pw_name'],
    category: row['pw_category'],
    description_short: row['pw_short_desc'],
    description: row['pw_long_desc'],
    suit_for: row['pw_suit'],
    job_roles: row['pw_job_roles'],
    avg_salary: row['pw_avg_salary'],
    projected_growth: row['pw_proj_growth']
  }
  Pathway.create!(pathway)
  puts "#{pathway.name} (catergory: #{pathway.category}) seeded!"
  puts "------------------------------------"
end

# ******************* Courses *******************
puts "------------------------------------------------------------------------"
filepath = "db/csv/courses.csv"
CSV.foreach(filepath, headers: :first_row) do |row|
  course = {
    title: row['co_title'],
    description: row['co_desc'],
    url: row['co_url'],
    rating: row['co_rating'],
    projected_growth: row['co_proj_growth'],
    pathway: row['pathway']
  }
  Course.create!(course)
  puts "#{course.title} for #{course.pathway} seeded!"
  puts "------------------------------------"
end

# ******************* Assessments *******************
# puts "------------------------------------------------------------------------"

# ******************* Skills *******************
