require 'rails_helper'

RSpec.describe 'department index' do
  describe 'user story1' do
    
    it 'shows the departments name and floor' do
      department = Department.create!(name: 'IT', floor: 'Basement')

      visit "/departments"

      expect(page).to have_content(department.name)
      expect(page).to have_content(department.floor)
    end

    it 'shows the employees for each department' do
      department = Department.create!(name: 'IT', floor: 'Basement')
      employee = Employee.create!(name: 'Christina Aguilera', level: 2, department_id: department.id)

      visit "/departments"

      expect(page).to have_content(employee.name)
    end
  end
end