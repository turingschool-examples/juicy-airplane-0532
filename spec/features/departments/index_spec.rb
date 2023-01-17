require "rails_helper"

RSpec.describe 'Department index page' do
  before :each do
    @dept1 = Department.create!(name:'IT', floor:'Basement')
    @dept2 = Department.create!(name:'HR', floor:'First')
    
    @employee1 = Employee.create!(name: 'Jen', level: 1, department: @dept1)
    @employee2 = Employee.create!(name: 'Roy', level: 2, department: @dept1)
    @employee3 = Employee.create!(name: 'Moss', level: 2, department: @dept1)
    @employee4 = Employee.create!(name: 'Toby', level: 2, department: @dept2)
    
  end

  describe 'user story one' do
    it 'when I visit the department index page' do
      # # As a user,
      # # When I visit the Department index page,
      visit departments_path
      
      expect(page).to have_content(@dept1.name)
      expect(page).to have_content(@dept2.name)
      
      within "#dept-#{@dept1.id}" do
        expect(page).to have_content(@dept1.floor)
        expect(page).to have_content(@employee1.name)
        expect(page).to have_content(@employee2.name)
        expect(page).to have_content(@employee3.name)
        # # I see each department's name and floor
        # # And underneath each department, I can see the names of all of its employees
      end
      
      within "#dept-#{@dept2.id}" do
        expect(page).to have_content(@dept2.floor)
        expect(page).to have_content(@employee4.name)
        # # I see each department's name and floor
        # # And underneath each department, I can see the names of all of its employees
      end
    end
  end
end
