class EmployeeTicketsController < ApplicationController

  def destroy
    employee_ticket = EmployeeTicket.find(params[:ticket])
    employee_ticket.destroy
    binding.pry
    redirect_to employee_path(employee)
  end
  
  private

  def employee_tickets_params
    params.permit(:employee, :ticket)
  end
end