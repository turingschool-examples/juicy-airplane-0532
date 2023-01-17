class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id]) #pry here if needed
  end
end