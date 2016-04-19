# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
Role.create(name: "Designer")
Role.create(name: "Developer")

User.create(name: "Tartan", email: "tartan@cmu.edu", password: "foobar", admin: true, role_id: Role.first.id)

Platform.create(name: "Web App")
Platform.create(name: "iPhone App")
Platform.create(name: "Android App")
