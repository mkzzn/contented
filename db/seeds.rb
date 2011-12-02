# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create :email => "mk@mkzzn.org",
:first_name => "Mike",
:last_name => "Zazaian",
:password => "password",
:password_confirmation => "password",
:role => "admin"

user = User.find_by_email "mk@mkzzn.org"
user.confirmed_at = Time.now
user.save
