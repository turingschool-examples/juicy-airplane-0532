class EmployeeTicket < ApplicationRecord
  has_many :employees 
  has_many :tickets
end