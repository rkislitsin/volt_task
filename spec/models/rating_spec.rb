require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject {
    described_class.new(player: Player.create(name: 'name'),
                        achievement: Achievement.create(name: 'name'),
                        match: Match.create(name: 'name',
                                            home_command: Command.create(name: 'name'),
                                            guest_command: Command.create(name: 'name2')))
  }

  describe 'Associations' do
    it { should belong_to(:player) }
    it { should belong_to(:achievement) }
    it { should belong_to(:match) }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is NOT valid without player' do
      subject.player = nil
      expect(subject).to_not be_valid
    end

    it 'is NOT valid without achievement' do
      subject.achievement = nil
      expect(subject).to_not be_valid
    end

    it 'is NOT valid without match' do
      subject.match = nil
      expect(subject).to_not be_valid
    end
  end
end
