require 'rails_helper'

RSpec.describe Player, type: :model do
  subject {
    described_class.new(name: 'name',
                        command:  Command.create(name: 'name'))
  }

  describe 'Associations' do
    it { should belong_to(:command) }
    it { should have_many(:ratings) }
    it { should have_many(:achievements)
                    .through(:ratings)
                    .dependent(:destroy) }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is NOT valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is NOT valid without command' do
      subject.command = nil
      expect(subject).to_not be_valid
    end
  end
end
