# frozen_string_literal: true

RSpec.describe InputParser, type: :service do
  describe '.parse' do
    subject { described_class }

    context 'when the input is nil' do
      it 'is nil' do
        expect(subject.parse(nil)).to be_nil
      end
    end

    context 'when the input is an empty string' do
      it 'is nil' do
        expect(subject.parse('')).to be_nil
      end
    end

    command_list.each do |command|
      context "when the input is '#{command.upcase}'" do
        it 'contains the executable command' do
          expect(subject.parse(command.upcase))
            .to include Object.const_get(command)
        end
      end
    end

    context 'when the input matches a command with incorrect casing' do
      it 'contains the executable command' do
        expect(subject.parse('place'))
          .to include Place
      end
    end

    context 'when the input includes arguments' do
      context 'as comma separated' do
        it 'contains the arguments as an array' do
          expect(subject.parse('PLACE 0,0,NORTH').last)
            .to eq [0, 0, 'NORTH']
        end
      end

      context 'as comma separated with whitespace padding' do
        it 'contains the arguments as an array' do
          expect(subject.parse('PLACE 0 ,          0, NORTH').last)
            .to eq [0, 0, 'NORTH']
        end
      end
    end

    context 'when the input does not match a defined command' do
      let(:input) { a_string }

      it 'raises an invalid command error' do
        expect { subject.parse(input) }
          .to raise_error InvalidCommandError,
                          I18n.t('errors.invalid_command', input:)
      end
    end
  end
end
