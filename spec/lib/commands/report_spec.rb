# frozen_string_literal: true

RSpec.describe Report, type: :command do
  describe '.run' do
    subject { described_class }

    include_context 'with IO'

    let(:robot) { double }
    let(:report) { a_string }

    before do
      allow(robot).to receive(:report).and_return report

      subject.run(robot:, stdout:)
    end

    it 'prints the return value of Robot#report' do
      expect(stdout.string).to include report
    end
  end
end
