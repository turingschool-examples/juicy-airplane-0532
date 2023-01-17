class Employee < ApplicationRecord
  validates_presence_of :name,
                        :level
  belongs_to :department
  has_many :tickets
end