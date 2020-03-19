require 'rails_helper'

RSpec.describe Achievement, type: :model do
  subject {
    described_class.new(name: 'пробежал 10+ км')
  }

  describe 'Associations' do
    it { should have_many(:ratings) }
    it { should have_many(:players).through(:ratings).dependent(:destroy) }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is NOT valid without attributes' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
