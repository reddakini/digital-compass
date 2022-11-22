# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

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
# puts "------------------------------------------------------------------------"

# ******************* Courses *******************
# puts "------------------------------------------------------------------------"

# ******************* Assessments *******************
# puts "------------------------------------------------------------------------"

# ******************* Skills *******************
