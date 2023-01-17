class Ticket < ApplicationRecord
  validates_presence_of :subject,
                        :age,
                        :open
  has_many :employee_tickets
  has_many :employees, through: :employee_tickets
end
