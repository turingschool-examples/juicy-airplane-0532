require 'rails_helper'

RSpec.describe 'index' do
  describe 'story 1' do 
#     As a user,
# When I visit the Department index page,
# I see each department's name and floor
# And underneath each department, I can see the names of all of its employees
    it 'has each department name and floor' do 
      dep_1 = Department.create!(name: "Kyles department", floor: "two")
      dep_2 = Department.create!(name: "Jacks department", floor: "three")
      employee_1 = Employee.create!(name: "Jack", level: 3, department_id: dep_1.id)
      employee_2 = Employee.create!(name: "Connor", level: 2, department_id: dep_1.id)
      ticket_1 = Ticket.create!( subject: "sales", age: 5, open:true, employee_id: employee_2.id)
      ticket_2 = Ticket.create!( subject: "inventory", age: 4, open:true, employee_id: employee_1.id)
      employee_ticket_1 = EmployeeTicket.create!( employee_id: employee_1.id, tickets_id: ticket_2.id)
      employee_ticket_2 = EmployeeTicket.create!( employee_id: employee_2.id, tickets_id: ticket_1.id)

      visit "/departments"

      expect(page).to have_content(dep_1.name)
      expect(page).to have_content(dep_1.floor)
      expect(page).to have_content(dep_2.name)
      expect(page).to have_content(dep_2.floor)
    end
    it 'has names of employees under each department' do
      dep_1 = Department.create!(name: "Kyles department", floor: "two")
      employee_1 = Employee.create!(name: "Jack", level: 3, department_id: dep_1.id)
      employee_2 = Employee.create!(name: "Connor", level: 2, department_id: dep_1.id)
      ticket_1 = Ticket.create!( subject: "sales", age: 5, open:true, employee_id: employee_2.id)
      ticket_2 = Ticket.create!( subject: "inventory", age: 4, open:true, employee_id: employee_1.id)
      employee_ticket_1 = EmployeeTicket.create!( employee_id: employee_1.id, tickets_id: ticket_2.id)
      employee_ticket_2 = EmployeeTicket.create!( employee_id: employee_2.id, tickets_id: ticket_1.id)

      visit "/departments"
      expect(page).to have_content(employee_1.name)
      expect(page).to have_content(employee_2.name)
    end
  end
end