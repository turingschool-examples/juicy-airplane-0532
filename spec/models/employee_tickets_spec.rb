require 'rails_helper'

RSpec.describe EmployeeTickets, type: :model do
  describe 'relationships' do
    it { should have_many :employees }
    it { should have_many :tickets }
    
  end
end