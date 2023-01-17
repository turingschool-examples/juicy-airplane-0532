class Employee < ApplicationRecord
  validates_presence_of :name,
                        :level
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets
  
  
  
  def self.tickets
    tix = EmployeeTicket.where("employee > ?", self.id)
    
    tix.each do |t|
      binding.pry
      Ticket.where("ticket > ?", t.id).where("open > ?", true)
    end
  end
  
  # def self.open_tickets
  #   self.tickets.where("open > ?", true)
  # end
  
end