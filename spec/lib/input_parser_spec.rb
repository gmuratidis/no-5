# frozen_string_literal: true

RSpec.describe InputParser, type: :service do
  describe '.parse' do
    subject { described_class }

    context 'when the input is nil' do
      it 'is nil'
    end

    context 'when the input is an empty string' do
      it 'is nil'
    end

    command_list.each do |command|
      context "when the input is '#{command}'" do
        it 'contains the executable command'
      end
    end

    context 'when the input matches a command with incorrect casing' do
      it 'contains the executable command'
    end

    context 'when the input includes arguments' do
      it 'contains the arguments as an array'
    end

    context 'when the input does not match a defined command' do
      it 'raises an invalid command error'
    end
  end
end
