# frozen_string_literal: true

RSpec.describe Place, type: :command do
  describe '.run' do
    subject { described_class }

    let(:robot) { double }

    before do
      allow(robot).to receive :place
    end

    context 'when given the wrong number of arguments' do
      it 'raises an ValidationError' do
        expect { subject.run(1, 'NORTH') }
          .to raise_error ValidationError, I18n.t('errors.argument_count')
      end
    end

    context 'when x is not an integer' do
      it 'raises an ValidationError' do
        expect { subject.run(a_string, 0, 'NORTH') }
          .to raise_error ValidationError, I18n.t('errors.not_an_integer', arg: :x)
      end
    end

    context 'when x is less than 0' do
      it 'raises an ValidationError' do
        expect { subject.run(-1, 0, 'NORTH') }
          .to raise_error ValidationError, I18n.t('errors.not_an_integer', arg: :x)
      end
    end

    context 'when y is not an integer' do
      it 'raises an ValidationError' do
        expect { subject.run(0, a_string, 'NORTH') }
          .to raise_error ValidationError, I18n.t('errors.not_an_integer', arg: :y)
      end
    end

    context 'when y is less than 0' do
      it 'raises an ValidationError' do
        expect { subject.run(0, -1, 'NORTH') }
          .to raise_error ValidationError, I18n.t('errors.not_an_integer', arg: :y)
      end
    end

    context 'when direction is nil' do

    end

    context 'when direction is an empty string' do

    end

    context 'when direction is not a valid direction' do

    end

    context 'when all arguments are valid' do
      let(:x) { a_number approx: 5 }
      let(:y) { a_number approx: 5 }
      let(:direction) { 'NORTH' }

      before do
        subject.run x, y, direction, robot:
      end

      it 'prints the return value of Robot#report' do
        expect(robot).to have_received(:place).with x, y, direction
      end
    end
  end
end
