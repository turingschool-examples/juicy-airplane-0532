# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.destroy_all
Department.destroy_all

@dept1 = Department.create!(name:'IT', floor:'Basement')
@dept2 = Department.create!(name:'HR', floor:'First')

@employee1 = Employee.create!(name: 'Jen', level: 1, department: @dept1)
@employee2 = Employee.create!(name: 'Roy', level: 2, department: @dept1)
@employee3 = Employee.create!(name: 'Moss', level: 2, department: @dept1)
@employee4 = Employee.create!(name: 'Toby', level: 2, department: @dept2)