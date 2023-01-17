class Employee < ApplicationRecord
  validates_presence_of :name,
                        :level
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets
end