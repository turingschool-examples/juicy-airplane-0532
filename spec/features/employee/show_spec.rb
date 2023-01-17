require 'rails_helper'

RSpec.describe 'show' do
  describe 'story 2' do
#     As a user,
# When I visit the Employee show page,
# I see the employee's name and department name,
# and I see a list of the employee's tickets including the ticket subject and age,
# And I see that this list is ordered from oldest to youngest, 
# And I see that this list only includes open tickets
    it 'shows the employees name and department name' do
      dep_1 = Department.create!(name: "Kyles department", floor: "two")
      dep_2 = Department.create!(name: "Jacks department", floor: "three")
      employee_1 = Employee.create!(name: "Jack", level: 3, department_id: dep_1.id)
      employee_2 = Employee.create!(name: "Connor", level: 2, department_id: dep_1.id)
      ticket_1 = Ticket.create!( subject: "sales", age: 5, open:true, employee_id: employee_2.id)
      ticket_2 = Ticket.create!( subject: "inventory", age: 4, open:true, employee_id: employee_1.id)
      ticket_3 = Ticket.create!( subject: "inventory", age: 7, open:true, employee_id: employee_1.id)
      ticket_4 = Ticket.create!( subject: "sales", age: 7, open:false, employee_id: employee_1.id)
      employee_ticket_1 = EmployeeTicket.create!( employee_id: employee_1.id, tickets_id: ticket_2.id)
      employee_ticket_2 = EmployeeTicket.create!( employee_id: employee_2.id, tickets_id: ticket_1.id)

      visit "employees/#{employee_1.id}"

      expect(page).to have_content((employee_1.name))
      expect(page).to have_content((dep_1.name))
    end
    it 'shows all of that employees tickets that are open' do
      dep_1 = Department.create!(name: "Kyles department", floor: "two")
      dep_2 = Department.create!(name: "Jacks department", floor: "three")
      employee_1 = Employee.create!(name: "Jack", level: 3, department_id: dep_1.id)
      employee_2 = Employee.create!(name: "Connor", level: 2, department_id: dep_1.id)
      ticket_1 = Ticket.create!( subject: "sales", age: 5, open:true, employee_id: employee_2.id)
      ticket_2 = Ticket.create!( subject: "inventory", age: 4, open:true, employee_id: employee_1.id)
      ticket_3 = Ticket.create!( subject: "inventory", age: 7, open:true, employee_id: employee_1.id)
      ticket_4 = Ticket.create!( subject: "sales", age: 7, open:false, employee_id: employee_1.id)
      employee_ticket_1 = EmployeeTicket.create!( employee_id: employee_1.id, tickets_id: ticket_2.id)
      employee_ticket_2 = EmployeeTicket.create!( employee_id: employee_1.id, tickets_id: ticket_3.id)
      employee_ticket_3 = EmployeeTicket.create!( employee_id: employee_1.id, tickets_id: ticket_4.id)
      employee_ticket_4 = EmployeeTicket.create!( employee_id: employee_2.id, tickets_id: ticket_1.id)

      visit "employees/#{employee_1.id}"

      expect(page).to have_content(ticket_2.subject)
      expect(page).to have_content(ticket_2.age)
      expect(page).to have_content(ticket_3.subject)
      expect(page).to have_content(ticket_3.age)
      expect(page).to_not have_content(ticket_4.subject)
      expect(page).to_not have_content(ticket_4.age)
    end
    it 'has the list ordered oldest to youngest'
  end
end