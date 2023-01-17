class Department < ApplicationRecord
  validates_presence_of :name,
                        :floor
  has_many :employees
end