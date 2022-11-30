# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require "csv"

# ******************* Clearing *******************
puts "\n"
puts "\n"
puts "------------------------------------------------------------------------"
puts "Destroying all table contents..."
puts "\n"
RecommendedPathway.destroy_all
puts "...table contents in recommended_pathways destroyed!"
Recommendation.destroy_all
puts "...table contents in recommendations destroyed!"
UserSkill.destroy_all
puts "...table contents in user_skills destroyed!"
UserValue.destroy_all
puts "...table contents in user_values destroyed!"
Bookmark.destroy_all
puts "...table contents in bookmarks destroyed!"
RecommendedCourse.destroy_all
puts "...table contents in recommended_courses destroyed!"
PathwaySkill.destroy_all
puts "...table contents in pathway_skills destroyed!"
Skill.destroy_all
puts "...table contents in skills destroyed!"
SkillCategory.destroy_all
puts "...table contents in skill_categories destroyed!"
Course.destroy_all
puts "...table contents in courses destroyed!"
Pathway.destroy_all
puts "...table contents in pathways destroyed!"
Value.destroy_all
puts "...table contents in values destroyed!"
User.destroy_all
puts "...table contents in users destroyed!"

# ******************* Users *******************
puts "\n"
puts "\n"
puts "------------------------------------------------------------------------"
puts "Seeding users..."
puts "\n"
5.times do |i|
  new_user = User.new(
    first_name: Faker::Name.female_first_name,
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
  new_skill_category = SkillCategory.find_by(name: row['sk_category'])
  if new_skill_category.nil?
    new_skill_category = SkillCategory.new(
      name: row['sk_category']
    )
    new_skill_category.save!
    puts "Skill category #{new_skill_category.name} seeded!"
    puts "------------------------------------"
  end

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

# ******************* Values *******************
puts "\n"
puts "\n"
puts "------------------------------------------------------------------------"
puts "Seeding values..."
puts "\n"
filepath = "db/csv/values.csv"
CSV.foreach(filepath, headers: :first_row) do |row|
  new_value = Value.new(name: row['v_name'])
  new_value.save!
  puts "#{new_value.name} seeded!"
  puts "------------------------------------"
end
puts "values seeded from db/values.csv!"

# ******************* Further Seeds after here *******************
puts "\n"
puts "\n"
