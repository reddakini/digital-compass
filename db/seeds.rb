# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require "csv"

# ******************* Clearing *******************
# UserAnswer.destroy_all
# Recommendation.destroy_all
# Assessment.destroy_all
# UserSkills.destroy_all
RecommendedCourse.destroy_all
PathwaySkill.destroy_all
Skill.destroy_all
SkillCategory.destroy_all
Course.destroy_all
Pathway.destroy_all
User.destroy_all

# ******************* Users *******************
puts "\n"
puts "\n"
puts "------------------------------------------------------------------------"
puts "Seeding users..."
puts "\n"
5.times do |i|
  new_user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "email#{i + 1}@gmail.com",
    password: "123456"
  )
  new_user.save!
  puts "#{new_user.first_name} #{new_user.last_name}"
  puts "#{new_user.email} / pw: #{new_user.password} seeded!"
  puts "------------------------------------"
end
puts "5 users seeded using Faker!"

# ******************* Pathways *******************
puts "\n"
puts "\n"
puts "------------------------------------------------------------------------"
puts "Seeding pathways..."
puts "\n"
filepath = "db/csv/pathways.csv"
CSV.foreach(filepath, headers: :first_row) do |row|
  new_pathway = Pathway.new(
    name: row['pw_name'],
    category: row['pw_category'],
    description_short: row['pw_short_desc'],
    description: row['pw_long_desc'],
    suit_for: row['pw_suit'],
    job_roles: row['pw_job_roles'],
    avg_salary: row['pw_avg_salary'],
    projected_growth: row['pw_proj_growth']
  )
  new_pathway.save!
  puts "#{new_pathway.name} (catergory: #{new_pathway.category}) seeded!"
  puts "------------------------------------"
end
puts "pathways seeded from db/pathways.csv!"

# ******************* Courses *******************
puts "\n"
puts "\n"
puts "------------------------------------------------------------------------"
puts "Seeding courses and recommended_courses..."
puts "\n"
filepath = "db/csv/courses.csv"
CSV.foreach(filepath, headers: :first_row) do |row|
  new_course = Course.new(
    title: row['co_title'],
    description: row['co_desc'],
    url: row['co_url'],
    rating: row['co_rating']
  )
  new_course.save!
  puts "#{new_course.title} seeded!"

  pathways = row['pathway'].split(',')
  pathways.each do |pathway|
    found_pathway = Pathway.find_by(name: pathway)
    new_recommended_course = RecommendedCourse.new(
      pathway: found_pathway,
      course: new_course
    )
    new_recommended_course.save!
    puts "... for #{found_pathway.name} seeded!"
  end
  puts "------------------------------------"
end
puts "courses and recommended_courses seeded from db/courses.csv!"

# ******************* Skills *******************
puts "\n"
puts "\n"
puts "------------------------------------------------------------------------"
puts "Seeding skill_categories, skills and pathway_skills..."
puts "\n"
filepath = "db/csv/skills.csv"
CSV.foreach(filepath, headers: :first_row) do |row|
  new_skill_category = SkillCategory.new(
    name: row['sk_category']
  )
  new_skill_category.save!

  new_skill = Skill.new(
    name: row['sk_skill'],
    skill_category: new_skill_category
  )
  new_skill.save!
  puts "#{new_skill.name} with category #{new_skill_category.name} seeded!"

  pathways = row['pathway'].split(',')
  pathways.each do |pathway|
    found_pathway = Pathway.find_by(name: pathway)
    new_pathway_skill = PathwaySkill.new(
      pathway: found_pathway,
      skill: new_skill
    )
    new_pathway_skill.save!
    puts "... for #{found_pathway.name} seeded!"
  end
  puts "------------------------------------"
end
puts "skill_categories, skills and pathway_skills seeded from db/skill.csv!"

# ******************* Further Seeds after here *******************
puts "\n"
