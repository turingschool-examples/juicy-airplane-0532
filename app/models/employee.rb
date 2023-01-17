class Employee < ApplicationRecord
  validates_presence_of :name,
                        :level
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets
  
  
  
  def self.tickets
    tix = EmployeeTicket.find_by("employee = ?", self.id)
  end
  
  def open_tickets
    tickets.where("open = ?", true).order(age: :desc)
  end
  
end