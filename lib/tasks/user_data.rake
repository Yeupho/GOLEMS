namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(email: "steventl214@hotmail.com", password: "password", password_confirmation: "password")
    admin.toggle!(:admin)

    User.create!(email: "tranle.steven@gmail.com", password: "password", password_confirmation: "password")
    User.create!(email: "joshm2050@gmail.com", password: "password", password_confirmation: "password")
    User.create!(email: "fontwanhood@gmail.com", password: "password", password_confirmation: "password")
    User.create!(email: "kwadwok15@yahoo.com", password: "password", password_confirmation: "password")
    User.create!(email: "lnguyen1664@gmail.com", password: "password", password_confirmation: "password")
    User.create!(email: "uhcoog.vallejo@gmail.com", password: "password", password_confirmation: "password")
  end
end