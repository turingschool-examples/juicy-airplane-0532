class AddEmployeeTicketToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :employee_ticket, foreign_key: true
  end
end
