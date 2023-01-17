class AddEmployeeTicketToTicket < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :employee_ticket, foreign_key: true
  end
end
