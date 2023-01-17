class Ticket < ApplicationRecord
  has_many :employees, through: :employee_tickets
end