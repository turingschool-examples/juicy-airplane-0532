require "rails_helper"

RSpec.describe 'Employee show page' do
  before :each do
    @dept1 = Department.create!(name:'IT', floor:'Basement')
    
    @employee1 = Employee.create!(name: 'Jen', level: 1, department: @dept1)
    @employee2 = Employee.create!(name: 'Roy', level: 2, department: @dept1)
    
    @tix1 = Ticket.create!(subject: "Broken printer", age: 3, open: true)
    @tix2 = Ticket.create!(subject: "Desk rabbit sighting", age: 2, open: false)
    @tix3 = Ticket.create!(subject: "Computer is on fire", age: 1, open: true)
    
    @et1 = EmployeeTicket.create!(employee: @employee1, ticket: @tix1)
    @et2 = EmployeeTicket.create!(employee: @employee1, ticket: @tix2)
    @et3 = EmployeeTicket.create!(employee: @employee1, ticket: @tix3)
    
    @et4 = EmployeeTicket.create!(employee: @employee2, ticket: @tix1)
    @et5 = EmployeeTicket.create!(employee: @employee2, ticket: @tix2)
    @et6 = EmployeeTicket.create!(employee: @employee2, ticket: @tix3)
    
    # # As a user,
    # # When I visit the Employee show page,
    visit employee_path(@employee1)
  end
  
  describe 'user story two' do
    it 'lists the employee information and open tickets' do
      # # I see the employee's name and department name,
      expect(page).to have_content(@employee1.name)
      expect(page).to have_content(@dept1.name)
      
      within "#tix-#{@tix1.id}" do
        expect(page).to have_content(@tix1.subject)
        expect(page).to have_content(@tix1.age)
      end
      
      within "#tix-#{@tix3.id}" do
        expect(page).to have_content(@tix3.subject)
        expect(page).to have_content(@tix3.age)
      end
      
      # # and I see a list of the employee's tickets including the ticket subject and age,
      expect(@tix1.subject).to appear_before(@tix3.subject)
      
      # # And I see that this list is ordered from oldest to youngest, 
      # # And I see that this list only includes open tickets
      expect(page).to_not have_content(@tix2.subject)
      expect(page).to_not have_content(@tix2.age)
    end
  end
  
  describe 'user story 3' do
    it 'has a button to remove a ticket from an employee' do
      within "#tix-#{@tix1.id}" do
        # # Next to each Ticket I see a link/button to unassign the ticket from the employee.
        expect(page).to have_button("Unassign Ticket")
      end
      
      within "#tix-#{@tix3.id}" do
        # # Next to each Ticket I see a link/button to unassign the ticket from the employee.
        expect(page).to have_button("Unassign Ticket")
      end
    end
    
    it 'removes a ticket from only the listed employee' do
      
      within "#tix-#{@tix3.id}" do
        expect(page).to have_button("Unassign Ticket")
        # # When I click this link/button,
        save_and_open_page
        click_on "Unassign Ticket"
        
        # # Then I am redirected back to that employee's show page
        expect(current_path).to eq(employee_path(@employee1))
      end
      
      # # and I no longer see the ticket listed.
      expect(page).to_not have_content(@tix3.subject)
      
      # # And when I visit another employee's show page that was assigned to that same ticket,
      visit employee_path(@employee2)
      
      # # Then I see the ticket is still listed for that other employee.
      within "#tix-#{@tix3.id}" do
        expect(page).to have_content(@tix3.subject)
        expect(page).to have_content(@tix3.age)
      end
    end
  end
end