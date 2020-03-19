require 'rails_helper'

RSpec.describe Command, type: :model do
  subject {
    described_class.new(name: 'name')
  }

  describe 'Associations' do
    it { should have_many(:players).dependent(:nullify) }
    it { should have_many(:home_matches)
                    .class_name('Match')
                    .with_foreign_key(:home_command_id)
                    .dependent(:destroy)
    }
    it { should have_many(:guest_matches)
                    .class_name('Match')
                    .with_foreign_key(:guest_command_id)
                    .dependent(:destroy)
    }  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is NOT valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
