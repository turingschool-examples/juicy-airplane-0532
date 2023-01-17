class EmployeeTicket < ApplicationRecord
  validates_presence_of :employee,
                        :ticket
  belongs_to :employee
  belongs_to :ticket
  
  # def self.open_tickets
  #   EmployeeTicket.where("ticket.open > ?", true)
  #   #return only open tix
  # end
end