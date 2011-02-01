# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts "Creating users for tests..."
User.create(:email => "rhaamo+toto@gruik.at", :name => "Toto", :login => "toto", :password => "toto1234AAA", :password_confirmation => "toto1234AAA")
User.create(:email => "rhaamo+truc@gruik.at", :name => "Truc", :login => "truc", :password => "toto1234AAA", :password_confirmation => "toto1234AAA")
puts "Users created : toto/toto1234AAA and truc/toto1234AAA"
