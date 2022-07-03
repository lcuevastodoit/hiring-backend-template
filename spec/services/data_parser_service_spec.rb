require 'spec_helper'

RSpec.describe DataParserService, type: :service do
  subject { described_class }
  let(:dollar_format_data) { File.read('spec/fixtures/people_by_dollar.txt') }
  let(:percent_format_data) { File.read('spec/fixtures/people_by_percent.txt') }

  describe '#call' do
    context 'when service receives dollar format data' do
      it 'returns an array with two person objects' do
        expect(subject.call(dollar_format_data, ' $ ').size).to eq 2
      end

      it 'has a result contains two instance objects of Person class' do
        expect(subject.call(dollar_format_data, ' $ ').first).to be_an_instance_of Person
        expect(subject.call(dollar_format_data, ' $ ').last).to be_an_instance_of Person
      end

      it 'has a first object with correct attributes' do
        expect(subject.call(dollar_format_data, ' $ ').first).to have_attributes(
          first_name: 'Rhiannon', city: 'Los Angeles', birthdate: '4/30/1974'
        )
      end

      it 'has a last object with correct attributes' do
        expect(subject.call(dollar_format_data, ' $ ').last).to have_attributes(
          first_name: 'Rigoberto', city: 'New York City', birthdate: '1/5/1962'
        )
      end
    end

    context 'when service receives percent format data' do
      it 'returns an array with two person objects' do
        expect(subject.call(percent_format_data, ' % ').size).to eq 2
      end

      it 'has a result contains two instance objects of Person class' do
        expect(subject.call(percent_format_data, ' % ').first).to be_an_instance_of Person
        expect(subject.call(percent_format_data, ' % ').last).to be_an_instance_of Person
      end

      it 'has a last object with correct attributes' do
        expect(subject.call(percent_format_data, ' % ').first).to have_attributes(
          first_name: 'Mckayla', city: 'Atlanta', birthdate: '5/29/1986'
        )
      end

      it 'has a first object with correct attributes' do
        expect(subject.call(percent_format_data, ' % ').last).to have_attributes(
          first_name: 'Elliot', city: 'New York City', birthdate: '5/4/1947'
        )
      end
    end
  end
end
