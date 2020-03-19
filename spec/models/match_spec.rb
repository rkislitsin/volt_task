require 'rails_helper'

RSpec.describe Match, type: :model do
  subject {
    described_class.new(name: 'name',
                        home_command:  Command.create(name: 'name'),
                        guest_command: Command.create(name: 'another_name'))
  }

  describe 'Associations' do
    it { should belong_to(:home_command)
                    .class_name('Command')
                    .with_foreign_key(:home_command_id)
    }
    it { should belong_to(:guest_command)
                    .class_name('Command')
                    .with_foreign_key(:guest_command_id)
    }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is NOT valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is NOT valid without home command' do
      subject.home_command = nil
      expect(subject).to_not be_valid
    end

    it 'is NOT valid without guest_command' do
      subject.guest_command = nil
      expect(subject).to_not be_valid
    end

  end
end
