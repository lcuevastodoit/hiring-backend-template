require 'spec_helper'

RSpec.describe Person, type: :model do
  subject { described_class.new(first_name: 'John', city: 'NYC', birthdate: '5-4-1947') }

  describe '#create_person' do
    describe 'self.create_people' do
      it 'creates a new person' do
        expect(subject.create_person).to be_a(Person)
      end
    end

    describe '#first_name' do
      it 'returns the first name' do
        expect(subject.create_person.first_name).to eq 'John'
      end
    end

    describe '#city' do
      it 'returns the city converted from acronym to full name' do
        expect(subject.create_person.city).to eq 'New York City'
      end
    end

    describe '#birthdate' do
      it 'returns the formatted date' do
        expect(subject.create_person.birthdate).to eq '4/5/1947'
      end
    end
  end
end
