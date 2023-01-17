require 'rails_helper'

RSpec.describe EmployeeTicket, type: :model do
  describe 'validations' do
    it { should validate_presence_of :employee }
    it { should validate_presence_of :ticket }
  end
  
  describe 'relationships' do
    it { should belong_to :employee }
    it { should belong_to :ticket }
  end
end
