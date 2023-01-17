class EmployeeTicketsController < ApplicationController

  def destroy
    employee_ticket = EmployeeTicket.find(params[:id])
    employee_ticket.destroy
    redirect_to "/employees/#{employee.id}"
  end
end