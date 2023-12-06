# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |i|
    Admin.create!(name: "Team#{i}", email: "team#{i}@example.com", password: "Password123",password_confirmation: "Password123")
  end
  
  5.times do |i|
    user = User.create!(email: "user#{i}@example.com", password: "Password123", password_confirmation: "Password123", name: "Username #{i}",phone_number: "090-1111-222#{i}")
  
    2.times do |j|
      admin_id = rand(1..5)
      dancer = user.dancers.create!(admin_id: admin_id, nickname: "Dancer #{j}", age: "1", gender: "1", profile: "aaa", registration_code: "aaa")
  
      5.times do |k|
        now = Time.current
        dancer.events.create!(admin_id: "1", day: now + k.days, title: "Eventname #{k}", area: "富山", context: "???", status: "1", release_flag: "true")
      end
    end
  end