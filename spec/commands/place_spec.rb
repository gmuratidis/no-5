# frozen_string_literal: true

RSpec.describe Place, type: :command do
  describe '.run' do
    subject { described_class }

    let(:robot) { double }

    let(:x) { a_number approx: 5 }
    let(:y) { a_number approx: 5 }
    let(:direction) { 'NORTH' }

    before do
      allow(robot).to receive :place

      subject.run(x, y, direction, robot:)
    end

    it 'prints the return value of Robot#report' do
      expect(robot).to have_received(:place).with x, y, direction
    end
  end
end
