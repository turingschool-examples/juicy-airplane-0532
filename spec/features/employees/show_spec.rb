require "rails_helper"

RSpec.describe 'Employee show page' do
  before :each do
    @dept1 = Department.create!(name:'IT', floor:'Basement')
    
    @employee1 = Employee.create!(name: 'Jen', level: 1, department: @dept1)
    
    @tix1 = Ticket.create!(subject: "Broken printer", age: 1, open: true)
    @tix2 = Ticket.create!(subject: "Desk rabbit sighting", age: 2, open: false)
    @tix3 = Ticket.create!(subject: "Computer is on fire", age: 3, open: true)
    
    @et1 = EmployeeTicket.create!(employee: @employee1, ticket: @tix1)
    @et2 = EmployeeTicket.create!(employee: @employee1, ticket: @tix2)
    @et3 = EmployeeTicket.create!(employee: @employee1, ticket: @tix3)
  end
  
  describe 'user story two' do
    it 'when I visit an employee show page' do
      # # As a user,
      # # When I visit the Employee show page,
      visit employee_path(@employee1)
      # # I see the employee's name and department name,
      expect(page).to have_content(@employee1.name)
      expect(page).to have_content(@dept1.name)
      
      within "#tix-#{@et1.id}" do
        expect(page).to have_content(@tix1.subject)
        expect(page).to have_content(@tix1.age)
      end
      
      within "#tix-#{@et3.id}" do
        expect(page).to have_content(@tix3.subject)
        expect(page).to have_content(@tix3.age)
      end
      
      expect(page).to_not have_content(@tix2.subject)
      expect(page).to_not have_content(@tix2.age)
      # # and I see a list of the employee's tickets including the ticket subject and age,
      
      # # And I see that this list is ordered from oldest to youngest, 
      # # And I see that this list only includes open tickets
    end
  end
end