# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.create(email: "test@testr.com",
                    password: "qweqweqqwe",
                    password_confirmation: "qweqweqqwe",
                    first_name:'qwe',
                    last_name:'sdf',
                    phone: '0452198717')

puts "1 user has been created"

AdminUser.create(email: "anxing.qu@gmail.com",
                 password: "wewewe",
                 password_confirmation: "wewewe",
                 first_name:'Anxing',
                 last_name:'Qu',
                 phone: '0452198717')

puts "1 admin user has been created"


100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale postsrationale postsrationale postsrationale posts", user_id: @user.id, overtime_request: 2.5)
end

puts "100 posts have been created"

100.times do |audit_log|
  AuditLog.create(start_date: Date.today - 6.days, user_id: @user.id, status: 0)
end

puts "100 audit logs have been created"
