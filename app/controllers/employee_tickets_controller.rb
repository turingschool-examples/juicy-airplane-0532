class EmployeeTicketsController < ApplicationController

  def destroy
    employee_ticket = EmployeeTicket.find_by(ticket_id: params[:id], employee_id: params[:employee_id])
    employee = Employee.find(params[:employee_id])
    employee_ticket.destroy
    redirect_to employee_path(employee)
  end
  
  private

  def employee_tickets_params
    params.permit(:employee, :ticket)
  end
end