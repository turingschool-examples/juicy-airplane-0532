class Ticket < ApplicationRecord
  validates_presence_of :subject,
                        :age
                        # :open, :inclusion => [true, false]
  has_many :employee_tickets
  has_many :employees, through: :employee_tickets
end
