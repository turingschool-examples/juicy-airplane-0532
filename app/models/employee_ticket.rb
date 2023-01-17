class EmployeeTicket < ApplicationRecord
  validates_presence_of :employee,
                        :ticket
  belongs_to :employee
  belongs_to :ticket
end