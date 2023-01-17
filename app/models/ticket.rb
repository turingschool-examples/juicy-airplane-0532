class Ticket < ApplicationRecord
  validates_presence_of :subject,
                        :age,
                        :open
  belongs_to :employee
end
